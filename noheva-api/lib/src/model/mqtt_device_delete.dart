//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_device_delete.g.dart';

/// MQTT notification message about device deletion. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this device belongs to
@BuiltValue()
abstract class MqttDeviceDelete implements Built<MqttDeviceDelete, MqttDeviceDeleteBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this device belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttDeviceDelete._();

  factory MqttDeviceDelete([void updates(MqttDeviceDeleteBuilder b)]) = _$MqttDeviceDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttDeviceDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttDeviceDelete> get serializer => _$MqttDeviceDeleteSerializer();
}

class _$MqttDeviceDeleteSerializer implements PrimitiveSerializer<MqttDeviceDelete> {
  @override
  final Iterable<Type> types = const [MqttDeviceDelete, _$MqttDeviceDelete];

  @override
  final String wireName = r'MqttDeviceDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttDeviceDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'exhibitionId';
    yield serializers.serialize(
      object.exhibitionId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttDeviceDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttDeviceDeleteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'exhibitionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exhibitionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttDeviceDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttDeviceDeleteBuilder();
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

