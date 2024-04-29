import "dart:async";

import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:noheva_visitor_ui/utils/layout_controller.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// MQTT listener for Exhibition Pages
class PagesListener extends AbstractListener {
  @override
  String baseTopic = "${AbstractListener.BASE_TOPIC}/pages";

  @override
  void handleCreate(String message) async {
    SimpleLogger().info("Handling page create message...");
    final createMessage =
        AbstractListener.decodeMessage<MqttExhibitionPageCreate>(
            message, MqttExhibitionPageCreate);
    SimpleLogger().info(createMessage);
    final createdPageId = createMessage.id;
    final exhibitionId = createMessage.exhibitionId;
    if (createdPageId == null) {
      SimpleLogger()
          .info("Page ID is null, cannot handle page create message!");
      return;
    }
    if (exhibitionId == null) {
      SimpleLogger()
          .info("Exhibition ID is null, cannot handle page create message!");
      return;
    }
    final existingPage = await pageDao.findPage(createdPageId);
    if (existingPage != null) {
      SimpleLogger().info("Page already exists, ignoring...");
      return;
    }

    await _loadData(exhibitionId);
  }

  @override
  void handleDelete(String message) async {
    SimpleLogger().info("Handling page delete message...");
    final deleteMessage =
        AbstractListener.decodeMessage<MqttExhibitionPageDelete>(
            message, MqttExhibitionPageDelete);
    SimpleLogger().info(deleteMessage);
    final deletedPageId = deleteMessage.id;
    if (deletedPageId == null) {
      SimpleLogger()
          .info("Page ID is null, cannot handle page delete message!");
      return;
    }
    final existingPage = await pageDao.findPage(deletedPageId);
    if (existingPage == null) {
      SimpleLogger().info("Page does not exist, ignoring...");
      return;
    }
    for (var resource in existingPage.resources) {
      final pagesWithResource =
          await pageDao.listPagesWithResource(resource.data);
      if (PageController.offlineMediaTypes.contains(resource.type)) {
        if (pagesWithResource.length == 1) {
          await offlineFileController.deleteOfflineFile(resource.data);
        } else {
          SimpleLogger().info(
            "Resource with data ${resource.data} is used in multiple pages, not deleting!",
          );
        }
      }
    }
    await pageDao.deletePage(deletedPageId);
    SimpleLogger().info("Deleted page: $deletedPageId");
  }

  @override
  void handleUpdate(String message) async {
    SimpleLogger().info("Handling page update message...");
    final updateMessage =
        AbstractListener.decodeMessage<MqttExhibitionPageUpdate>(
            message, MqttExhibitionPageUpdate);
    SimpleLogger().info(updateMessage);
    final updatedPageId = updateMessage.id;
    final exhibitionId = updateMessage.exhibitionId;
    if (updatedPageId == null) {
      SimpleLogger()
          .info("Page ID is null, cannot handle page update message!");
      return;
    }
    if (exhibitionId == null) {
      SimpleLogger()
          .info("Exhibition ID is null, cannot handle page update message!");
      return;
    }
    final existingPage = await pageDao.findPage(updatedPageId);
    if (existingPage == null) {
      SimpleLogger().info("Page does not exist, ignoring...");
      return;
    }

    await _loadData(exhibitionId);
    eventBus.fire(RequestAchiveExhibitionPageIdEvent());
    final activePageId = await eventBus
        .on<ActiveExhibitionPageIdEvent>()
        .first
        .then((value) => value.pageId);
    if (activePageId == updatedPageId) {
      SimpleLogger().info("Page is active, updating screen...");
      eventBus.fire(LoadExhibitionPageByIdEvent(activePageId));
    } else {
      SimpleLogger().info("Page is not active, not updating!");
    }
  }

  /// Loads layouts and pages for the this device
  Future<void> _loadData(String exhibitionId) async {
    SimpleLogger().info("Loading layouts...");
    await LayoutController.loadLayouts(deviceId!);
    SimpleLogger().info("Successfully loaded layouts!");
    SimpleLogger().info("Loading pages...");
    final deviceDataApi = await apiFactory.getDeviceDataApi();
    final pages = (await deviceDataApi.listDeviceDataPages(
      deviceId: deviceId!,
    ))
        .data!
        .toList();
    await PageController.comparePages(exhibitionId, pages);
  }
}
