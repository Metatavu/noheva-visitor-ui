import 'package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart';
import 'package:noheva_visitor_ui/mqtt/mqtt_client.dart';
import 'package:simple_logger/simple_logger.dart';

/// MQTT listener for device being attached or detached from Exhibitions
class AttachListener {
  AttachListener() {
    setListeners();
  }

  Future setListeners() async {
    String baseTopic = await AbstractListener.baseTopic;
    mqttClient.addListeners({
      "$baseTopic/attach": handleAttach,
      "$baseTopic/detach": handleDetach,
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
