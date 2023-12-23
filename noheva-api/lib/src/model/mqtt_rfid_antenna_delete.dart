//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_rfid_antenna_delete.g.dart';

/// MQTT notification message about RFID antenna deletion. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this RFID antenna belongs to
@BuiltValue()
abstract class MqttRfidAntennaDelete implements Built<MqttRfidAntennaDelete, MqttRfidAntennaDeleteBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this RFID antenna belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttRfidAntennaDelete._();

  factory MqttRfidAntennaDelete([void updates(MqttRfidAntennaDeleteBuilder b)]) = _$MqttRfidAntennaDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttRfidAntennaDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttRfidAntennaDelete> get serializer => _$MqttRfidAntennaDeleteSerializer();
}

class _$MqttRfidAntennaDeleteSerializer implements PrimitiveSerializer<MqttRfidAntennaDelete> {
  @override
  final Iterable<Type> types = const [MqttRfidAntennaDelete, _$MqttRfidAntennaDelete];

  @override
  final String wireName = r'MqttRfidAntennaDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttRfidAntennaDelete object, {
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
    MqttRfidAntennaDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttRfidAntennaDeleteBuilder result,
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
  MqttRfidAntennaDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttRfidAntennaDeleteBuilder();
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

