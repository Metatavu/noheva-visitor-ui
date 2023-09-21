import "package:collection/collection.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:simple_logger/simple_logger.dart";

/// Layout Controller class
class LayoutController {
  /// Persists [newLayout]
  static Future<Layout?> persistLayout(DeviceLayout newLayout) async {
    SimpleLogger().info("Persisting layout ${newLayout.id}...");

    /// TODO: Use newLayout.screenOrientation
    return await layoutDao.storeLayout(
      LayoutsCompanion.insert(
        id: newLayout.id!,
        screenOrientation: 0,
        data: newLayout.data.html,
        modifiedAt: newLayout.modifiedAt,
      ),
    );
  }

  /// Loads Layouts from backend by [exhibitionDeviceId]
  static Future loadLayouts(String exhibitionDeviceId) async {
    SimpleLogger().info(
      "Loading layouts for exhibition device $exhibitionDeviceId...",
    );
    final deviceDataApi = await apiFactory.getDeviceDataApi();
    final existingLayouts = await layoutDao.listLayouts();
    final layouts = await deviceDataApi
        .listDeviceDataLayouts(exhibitionDeviceId: exhibitionDeviceId)
        .then((value) => value.data);
    if (layouts == null) {
      SimpleLogger().info(
          "No layouts found for exhibition device $exhibitionDeviceId, aborting!");
      return;
    }
    SimpleLogger().info("Successfully loaded ${layouts.length} layouts!");
    SimpleLogger().info("Persisting layouts...");
    final storedLayouts = [];
    for (var layout in layouts) {
      final existingLayout = existingLayouts.firstWhereOrNull(
        (element) => element.id == layout.id,
      );
      if (existingLayout == null) {
        storedLayouts.add(await persistLayout(layout));
      }
    }
    SimpleLogger()
        .info("Successfully persisted ${storedLayouts.length} layouts!");
  }

  /// Deletes existing Layouts
  static Future deleteLayouts() async {
    SimpleLogger().info("Deleting existing layouts...");

    await layoutDao.deleteLayouts();
  }
}
