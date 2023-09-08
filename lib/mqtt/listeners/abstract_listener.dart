import "dart:convert";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";

/// Abstract MQTT Listener class
abstract class AbstractListener {
  AbstractListener() {
    setListeners();
  }

  abstract String baseTopic;

  /// Returns a map of topic:callback entries handled by this listener.
  Map<String, Function(String)> getListeners() => {
        "$baseTopic/create": handleCreate,
        "$baseTopic/update": handleUpdate,
        "$baseTopic/delete": handleDelete
      };

  /// Callback function for handling create messages
  void handleCreate(String message);

  /// Callback function for handling update messages
  void handleUpdate(String message);

  /// Callback function for handling delete messages
  void handleDelete(String message);

  /// Sets listeners described here to MQTT Client
  Future setListeners() async {
    mqttClient.addListeners(getListeners());
  }

  /// Decodes message into JSON string
  Map<String, dynamic> decodeMessage(String message) => jsonDecode(message);

  static final String BASE_TOPIC = environment;
}
