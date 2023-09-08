import "package:meta/meta.dart";
import "package:noheva_visitor_ui/database/dao/keys_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";

/// Abstract MQTT Listener class
abstract class AbstractListener<T> {
  AbstractListener() {
    setListeners();
  }

  /// Returns a map of topic:callback entries handled by this listener.
  Future<Map<String, Function(String)>> getListeners() async => {
        "${await baseTopic}/create": handleCreate,
        "${await baseTopic}/update": handleUpdate,
        "${await baseTopic}/delete": handleDelete
      };

  /// Callback function for handling create messages
  void handleCreate(String message);

  /// Callback function for handling update messages
  void handleUpdate(String message);

  /// Callback function for handling delete messages
  void handleDelete(String message);

  /// Sets listeners described here to MQTT Client
  @protected
  Future setListeners() async {
    mqttClient.addListeners(await getListeners());
  }

  /// Deserializes message into [T] object
  T deserializeMessage(String message);

  static Future<String> get baseTopic async {
    String? deviceId = await keysDao.getDeviceId();
    if (deviceId == null) {
      throw Exception("Device id is null");
    }

    return "noheva/$environment/";
  }
}
