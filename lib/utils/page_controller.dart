import "package:collection/collection.dart";
import "package:html/dom.dart";
import "package:html/parser.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// Page Controller class
class PageController {
  static final offlineMediaTypes = [
    ExhibitionPageResourceType.image,
    ExhibitionPageResourceType.video
  ];

  /// Persists [newPage]
  static Future<Page?> persistPage(DevicePage newPage) async {
    SimpleLogger().info("Downloading page ${newPage.id} resources...");
    final Map<String, String?> offlinedResources = {};
    for (var resource in newPage.resources) {
      if (offlineMediaTypes.contains(resource.type)) {
        final resourceData = resource.data
            .replaceAll("url('", "")
            .replaceAll("')", "")
            .replaceAll("none", "");
        if (resourceData.isEmpty) continue;
        final offlinedFile =
            await offlineFileController.getOfflineFile(resourceData);
        offlinedResources[resource.id] = offlinedFile?.path;
      }
    }
    SimpleLogger().info("Persisting page ${newPage.id}...");

    final updatedResources = newPage.resources
        .map((res) => ExhibitionPageResource((builder) {
              builder.id = res.id;
              builder.type = res.type;
              builder.data = offlinedResources[res.id] ?? res.data;
            }))
        .toList();

    return await pageDao.storePage(
      PagesCompanion.insert(
        id: newPage.id,
        name: newPage.name ?? "Unnamed page",
        language: newPage.language,
        orderNumber: newPage.orderNumber,
        layoutId: newPage.layoutId,
        exhibitionId: newPage.exhibitionId,
        resources: updatedResources,
        eventTriggers: newPage.eventTriggers?.toList() ?? [],
        enterTransitions: newPage.enterTransitions?.toList() ?? [],
        exitTransitions: newPage.exitTransitions?.toList() ?? [],
        modifiedAt: newPage.modifiedAt,
      ),
    );
  }

  /// Loads Pages from backend by [deviceId]
  static Future<void> loadPages(String deviceId) async {
    SimpleLogger().info(
      "Loading pages for device $deviceId...",
    );
    final deviceDataApi = await apiFactory.getDeviceDataApi();
    final pages = await deviceDataApi
        .listDeviceDataPages(deviceId: deviceId)
        .then((value) => value.data);
    if (pages == null) {
      SimpleLogger().info("No pages found for device $deviceId, aborting!");
      return;
    }
    SimpleLogger().info("Successfully loaded ${pages.length} pages!");
    SimpleLogger().info("Persisting pages...");
    final List<Page?> storedPages = [];
    for (var page in pages) {
      storedPages.add(await persistPage(page));
    }
    SimpleLogger().info("Successfully persisted ${storedPages.length} pages!");
  }

  /// Deletes existing Pages
  static Future<void> deletePages() async {
    SimpleLogger().info("Deleting existing pages...");
    await pageDao.deletePages();
  }

  /// Compares pages modified at timestamps
  ///
  /// Returns true whether page from backend has been modified
  static bool isPageModified(Page existingPage, DevicePage newPage) {
    final existingPageModifiedAt =
        (existingPage.modifiedAt.millisecondsSinceEpoch / 1000).floor();
    final newPageModifiedAt =
        (newPage.modifiedAt.millisecondsSinceEpoch / 1000).floor();

    return newPageModifiedAt > existingPageModifiedAt;
  }

  /// Substitutes background images in [element] with local file paths
  ///
  /// This is a questionable workaround for the [flutter_widget_from_html_core] packages logic
  /// where background image source is provided from the url protocol
  static void _prepareBackgroundImages(Element element) {
    for (var child in element.children) {
      if (child.localName == "div") {
        var rawStyles = child.attributes["style"]!;
        Map<String, String> styles = {};
        for (var property in rawStyles.split(";")) {
          final split = property.split(":");
          if (split.length == 2) {
            final key = split[0].trim();
            final value = split[1].trim();
            styles[key] = value;
          }
        }

        String? backgroundImage = styles["background-image"];
        if (backgroundImage != null && backgroundImage != "none") {
          styles["background-image"] = "url(\"file://$backgroundImage\")";
        }

        final joinedStyles =
            styles.entries.map((e) => "${e.key}: ${e.value}").join("; ");
        child.attributes["style"] = joinedStyles;
      }
      _prepareBackgroundImages(child);
    }
  }

  /// Substitutes pages resource keys with actual resources
  static String substitutePageResources(
    String html,
    List<ExhibitionPageResource> resources,
  ) {
    for (var resource in resources) {
      html = html
          .replaceAll(
            "@resources/${resource.id}",
            resource.data,
          )
          .replaceAll(RegExp(r'width:\s*(\d+)\s*%'), "");
    }
    var doc = parse(html);
    _prepareBackgroundImages(doc.body!);
    return doc.body?.outerHtml ?? "";
  }

  /// Compares existing pages with page from backend
  ///
  /// Updates existing pages if they have been modified and
  /// deletes pages that have been deleted from backend.
  static Future<void> comparePages(
    String exhibitionId,
    List<DevicePage> newPages,
  ) async {
    final existingPages = await pageDao.listPages(exhibitionId);
    for (var page in newPages) {
      final existingPage = existingPages.firstWhereOrNull(
        (element) => element.id == page.id,
      );
      if (existingPage == null) {
        SimpleLogger().info("Page ${page.id} is new, persisting...");
        await persistPage(page);
        continue;
      }
      final pageIsModified = isPageModified(
        existingPage,
        page,
      );
      if (pageIsModified) {
        SimpleLogger().info("Page is modified, updating...");
        final existingResources = existingPage.resources;
        final newResources = page.resources;

        for (var existingResource in existingResources) {
          final newResource = newResources.firstWhereOrNull(
            (element) => element.id == existingResource.id,
          );
          final resourceIsChanged = existingResource.data != newResource?.data;
          final resourceIsOfflineable =
              offlineMediaTypes.contains(existingResource.type);

          if (resourceIsOfflineable && resourceIsChanged) {
            SimpleLogger().info(
              "Resource ${existingResource.id} is modified, deleting...",
            );
            await offlineFileController
                .deleteOfflineFile(existingResource.data);
          }
        }
        await persistPage(page);
      } else {
        SimpleLogger().info("Page is not modified. Not updating!");
      }
    }
    await _deleteUnusedPages(existingPages, newPages);
  }

  /// Deletes locally stored pages that are no longer being used
  static Future<void> _deleteUnusedPages(
    List<Page> existingPages,
    List<DevicePage> newPages,
  ) async {
    for (var existingPage in existingPages) {
      final newPage =
          newPages.firstWhereOrNull((page) => page.id == existingPage.id);
      if (newPage == null) {
        SimpleLogger().info(
          "Page ${existingPage.id} is deleted, deleting...",
        );
        await pageDao.deletePage(existingPage.id);
        final isLayoutUsed =
            newPages.any((page) => page.layoutId == existingPage.layoutId);
        if (!isLayoutUsed) {
          SimpleLogger().info(
            "Layout ${existingPage.layoutId} is not used anymore, deleting...",
          );
          await layoutDao.deleteLayout(existingPage.layoutId);
        }
      }
    }
  }
}
