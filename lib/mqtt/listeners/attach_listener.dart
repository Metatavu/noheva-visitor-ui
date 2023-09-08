import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
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
      "$baseTopic/devices/$deviceId/attach": handleAttach,
      "$baseTopic/devices/$deviceId/detach": handleDetach,
    });
  }

  /// Callback function for handling attach messages
  void handleAttach(String message) {
    SimpleLogger().info("Handling attach message: $message");
  }

  /// Callback function for handling detach messages
  void handleDetach(String message) {
    SimpleLogger().info("Handling detach message: $message");
  }
}
