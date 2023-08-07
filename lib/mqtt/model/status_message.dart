import "package:json_annotation/json_annotation.dart";
import "package:noheva_visitor_ui/mqtt/model/abstract_message.dart";

part "status_message.g.dart";

/// MQTT Status Message Class
@JsonSerializable()
class StatusMessage implements AbstractMqttMessage {
  StatusMessage({required this.status, required this.deviceId});

  final String status, deviceId;

  /// Converts JSON to Status Message
  factory StatusMessage.fromJson(Map<String, dynamic> json) =>
      _$StatusMessageFromJson(json);

  /// Converts Status Message to JSON
  @override
  Map<String, dynamic> toJson() => _$StatusMessageToJson(this);
}
