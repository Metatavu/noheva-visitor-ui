import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/mqtt/listeners/abstract_listener.dart";
import "package:simple_logger/simple_logger.dart";

/// MQTT listener for Exhibition Pages
class PagesListener extends AbstractListener {
  @override
  String baseTopic = "${AbstractListener.BASE_TOPIC}/pages";

  @override
  void handleCreate(String message) {
    final json = decodeMessage(message);
    final createMessage = MqttExhibitionPageCreate((builder) {
      builder.exhibitionId = json["exhibitionId"];
      builder.id = json["id"];
    });

    SimpleLogger().info("Handling create message: $createMessage");
  }

  @override
  void handleDelete(String message) {
    final json = decodeMessage(message);
    final deleteMessage = MqttExhibitionPageDelete((builder) {
      builder.exhibitionId = json["exhibitionId"];
      builder.id = json["id"];
    });

    SimpleLogger().info("Handling delete message: $deleteMessage");
  }

  @override
  void handleUpdate(String message) {
    final json = decodeMessage(message);
    final updateMessage = MqttExhibitionPageUpdate((builder) {
      builder.exhibitionId = json["exhibitionId"];
      builder.id = json["id"];
    });

    SimpleLogger().info("Handling update message: $updateMessage");
  }
}
