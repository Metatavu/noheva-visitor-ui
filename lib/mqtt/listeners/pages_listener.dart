import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:simple_logger/simple_logger.dart";

/// MQTT listener for Exhibition Pages
class PagesListener extends AbstractListener {
  @override
  String baseTopic = "${AbstractListener.BASE_TOPIC}/pages";

  @override
  void handleCreate(String message) {
    SimpleLogger().info("Handling page create message...");
    final createMessage =
        AbstractListener.decodeMessage(message, MqttExhibitionPageCreate);
    SimpleLogger().info(createMessage);
    // TODO: Implement logic for handling page create messages
  }

  @override
  void handleDelete(String message) {
    SimpleLogger().info("Handling page delete message...");
    final deleteMessage =
        AbstractListener.decodeMessage(message, MqttExhibitionPageDelete);
    SimpleLogger().info(deleteMessage);
    // TODO: Implement logic for handling page delete messages
  }

  @override
  void handleUpdate(String message) {
    SimpleLogger().info("Handling page update message...");
    final updateMessage =
        AbstractListener.decodeMessage(message, MqttExhibitionPageUpdate);
    SimpleLogger().info(updateMessage);
    // TODO: Implement logic for handling page update messages
  }
}
