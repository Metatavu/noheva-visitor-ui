import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/exhibition_dao.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/utils/layout_controller.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// MQTT listener for device being attached or detached from Exhibitions
class AttachListener {
  AttachListener() {
    setListeners();
  }

  /// Set listeners for attach and detach messages
  Future setListeners() async {
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
    final json = AbstractListener.decodeMessage(message);
    final attachedMessage = MqttDeviceAttachedToExhibition((builder) {
      builder.exhibitionId = json["exhibitionId"];
      builder.exhibitionDeviceId = json["exhibitionDeviceId"];
      builder.exhibitionDeviceGroupId = json["exhibitionDeviceGroupId"];
      builder.deviceId = json["deviceId"];
    });

    // There's no support for having device attached to multiple exhibitions and therefore existing exhibitions are deleted
    await exhibitionDao.deleteExhibitions();
    SimpleLogger().info("Deleted existing Exhibitions!");
    await exhibitionDao.storeExhibition(
      ExhibitionsCompanion.insert(
        id: attachedMessage.exhibitionId!,
        exhibitionDeviceId: attachedMessage.exhibitionDeviceId!,
        exhibitionDeviceGroupId: attachedMessage.exhibitionDeviceGroupId!,
      ),
    );
    SimpleLogger().info("Stored Exhibition: ${attachedMessage.exhibitionId}");
    SimpleLogger().info("Loading layouts...");
    await LayoutController.loadLayouts(attachedMessage.exhibitionDeviceId!);
    SimpleLogger().info("Successfully loaded layouts!");
    SimpleLogger().info("Loading pages...");
    await PageController.loadPages(attachedMessage.exhibitionDeviceId!);
    streamController.sink.add(attachedMessage.exhibitionId);
  }

  /// Callback function for handling detach messages
  void handleDetach(String message) {
    final json = AbstractListener.decodeMessage(message);
    final detachedMessage = MqttDeviceDetachedFromExhibition((builder) {
      builder.exhibitionId = json["exhibitionId"];
      builder.exhibitionDeviceId = json["exhibitionDeviceId"];
      builder.exhibitionDeviceGroupId = json["exhibitionDeviceGroupId"];
      builder.deviceId = json["deviceId"];
    });
  }
}
