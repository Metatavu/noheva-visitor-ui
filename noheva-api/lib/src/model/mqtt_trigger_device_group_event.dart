//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_trigger_device_group_event.g.dart';

/// MQTT notification message for informing device group members about tag proximity. Event in sent into /{device}/{antennaNumber} -topic.  This is actually not part of REST API spec but a realtime notification via MQTT channel 
///
/// Properties:
/// * [event] - name of triggered event
@BuiltValue()
abstract class MqttTriggerDeviceGroupEvent implements Built<MqttTriggerDeviceGroupEvent, MqttTriggerDeviceGroupEventBuilder> {
  /// name of triggered event
  @BuiltValueField(wireName: r'event')
  String? get event;

  MqttTriggerDeviceGroupEvent._();

  factory MqttTriggerDeviceGroupEvent([void updates(MqttTriggerDeviceGroupEventBuilder b)]) = _$MqttTriggerDeviceGroupEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttTriggerDeviceGroupEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttTriggerDeviceGroupEvent> get serializer => _$MqttTriggerDeviceGroupEventSerializer();
}

class _$MqttTriggerDeviceGroupEventSerializer implements PrimitiveSerializer<MqttTriggerDeviceGroupEvent> {
  @override
  final Iterable<Type> types = const [MqttTriggerDeviceGroupEvent, _$MqttTriggerDeviceGroupEvent];

  @override
  final String wireName = r'MqttTriggerDeviceGroupEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttTriggerDeviceGroupEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.event != null) {
      yield r'event';
      yield serializers.serialize(
        object.event,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttTriggerDeviceGroupEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttTriggerDeviceGroupEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.event = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttTriggerDeviceGroupEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttTriggerDeviceGroupEventBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

