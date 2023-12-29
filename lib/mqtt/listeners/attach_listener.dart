import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/device_exhibition_detail_dao.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/utils/layout_controller.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// MQTT listener for device being attached or detached from Exhibitions
class AttachListener {
  AttachListener() {
    setListeners();
  }

  /// Set listeners for attach and detach messages
  void setListeners() {
    String baseTopic = AbstractListener.BASE_TOPIC;
    if (deviceId == null) {
      throw Exception("Device ID is null, cannot set listeners!");
    }
    mqttClient.addListeners({
      "$baseTopic/devices/$deviceId/attached": handleAttach,
      "$baseTopic/devices/$deviceId/detached": handleDetach,
    });
  }

  /// Callback function for handling attach messages
  void handleAttach(String message) async {
    SimpleLogger().info("Handling attach message...");
    final attachedMessage =
        AbstractListener.decodeMessage<MqttDeviceAttachedToExhibition>(
            message, MqttDeviceAttachedToExhibition);
    SimpleLogger().info(attachedMessage);

    // There's no support for having device attached to multiple exhibitions and therefore existing exhibitions are deleted
    await pageDao.deletePages();
    await layoutDao.deleteLayouts();
    await deviceExhitionDetailDao.deleteDeviceExhibitionDetails();
    SimpleLogger().info("Deleted existing Exhibitions!");
    await deviceExhitionDetailDao.storeDeviceExhibitionDetail(
      DeviceExhibitionDetailsCompanion.insert(
        exhibitionId: attachedMessage.exhibitionId!,
        exhibitionDeviceId: attachedMessage.exhibitionDeviceId!,
        exhibitionDeviceGroupId: attachedMessage.exhibitionDeviceGroupId!,
      ),
    );
    SimpleLogger().info("Stored Exhibition: ${attachedMessage.exhibitionId}");
    SimpleLogger().info("Loading layouts...");
    await LayoutController.loadLayouts(deviceId!);
    SimpleLogger().info("Successfully loaded layouts!");
    SimpleLogger().info("Loading pages...");
    await PageController.loadPages(deviceId!);
    SimpleLogger().info("Successfully loaded pages!");
    final firstPage =
        await pageDao.findPageByOrderNumber(attachedMessage.exhibitionId!, 0);
    pageStreamController.sink.add(firstPage?.id);
  }

  /// Callback function for handling detach messages
  void handleDetach(String message) async {
    SimpleLogger().info("Handling detach message...");
    final detachedMessage =
        AbstractListener.decodeMessage<MqttDeviceDetachedFromExhibition>(
            message, MqttDeviceDetachedFromExhibition);
    SimpleLogger().info(detachedMessage);
    SimpleLogger().info(
      "Deleting exhibition ${detachedMessage.exhibitionId} content...",
    );
    final pages = await pageDao.listPages(detachedMessage.exhibitionId!);
    for (var page in pages) {
      for (var resource in page.resources) {
        if (PageController.offlineMediaTypes.contains(resource.type)) {
          await offlineFileController.deleteOfflineFile(resource.data);
        }
      }
      SimpleLogger().info("Deleted page ${page.id} offlined resources!");
    }
    await PageController.deletePages();
    SimpleLogger().info("Deleted pages!");
    await LayoutController.deleteLayouts();
    SimpleLogger().info("Deleted layouts!");
    await deviceExhitionDetailDao.deleteDeviceExhibitionDetails();
    SimpleLogger().info("Deleted exhibitions!");
    pageStreamController.sink.add(null);
  }
}
