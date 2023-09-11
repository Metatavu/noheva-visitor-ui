import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/converters/list_converter.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:simple_logger/simple_logger.dart";

/// Page Controller class
class PageController {
  /// Persists [newPage]
  static Future<Page?> persistPage(DevicePage newPage) async {
    SimpleLogger().info("Persisting page ${newPage.id}...");

    // TODO: Remove language from Page?
    return await pageDao.storePage(
      PagesCompanion.insert(
        id: newPage.id,
        name: newPage.name ?? "Unnamed page",
        language: "FI",
        orderNumber: newPage.orderNumber,
        layoutId: newPage.layoutId,
        exhibitionId: newPage.exhibitionId,
        resources: newPage.resources.toList(),
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
    await _deletePages();
    final storedPages = [];
    for (var page in pages) {
      print("---PAGE---");
      page.resources.forEach((p0) {
        print(p0.toJson());
      });
      storedPages.add(await persistPage(page));
    }
    SimpleLogger().info("Successfully persisted ${storedPages.length} pages!");
  }

  /// Deletes existing Pages
  static Future _deletePages() async {
    SimpleLogger().info("Deleting existing pages...");

    await pageDao.deletePages();
  }
}