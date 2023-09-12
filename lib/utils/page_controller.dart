import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// Page Controller class
class PageController {
  static final _offlineMediaTypes = [
    ExhibitionPageResourceType.image,
    ExhibitionPageResourceType.video
  ];

  /// Persists [newPage]
  static Future<Page?> persistPage(DevicePage newPage) async {
    SimpleLogger().info("Downloading page ${newPage.id} resources...");
    final offlinedResources = {};
    for (var resource in newPage.resources) {
      if (_offlineMediaTypes.contains(resource.type)) {
        final offlinedFile =
            await offlineFileController.getOfflineFile(resource.data);
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

    // TODO: Remove language from Page?
    return await pageDao.storePage(
      PagesCompanion.insert(
        id: newPage.id,
        name: newPage.name ?? "Unnamed page",
        language: "FI",
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

  /// Loads Pages from backend by [exhibitionDeviceId]
  static Future loadPages(String exhibitionDeviceId) async {
    SimpleLogger().info(
      "Loading pages for exhibition device $exhibitionDeviceId...",
    );
    final deviceDataApi = await apiFactory.getDeviceDataApi();
    final pages = await deviceDataApi
        .listDeviceDataPages(exhibitionDeviceId: exhibitionDeviceId)
        .then((value) => value.data);
    if (pages == null) {
      SimpleLogger().info(
          "No pages found for exhibition device $exhibitionDeviceId, aborting!");
      return;
    }
    SimpleLogger().info("Successfully loaded ${pages.length} pages!");
    SimpleLogger().info("Persisting pages...");
    await deletePages();
    final storedPages = [];
    for (var page in pages) {
      storedPages.add(await persistPage(page));
    }
    SimpleLogger().info("Successfully persisted ${storedPages.length} pages!");
  }

  /// Deletes existing Pages
  static Future deletePages() async {
    SimpleLogger().info("Deleting existing pages...");

    await pageDao.deletePages();
  }
}
