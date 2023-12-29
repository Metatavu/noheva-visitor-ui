//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_rfid_antenna_create.g.dart';

/// MQTT notification message about MQTT antenna creation. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this RFID antenna belongs to
@BuiltValue()
abstract class MqttRfidAntennaCreate implements Built<MqttRfidAntennaCreate, MqttRfidAntennaCreateBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this RFID antenna belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttRfidAntennaCreate._();

  factory MqttRfidAntennaCreate([void updates(MqttRfidAntennaCreateBuilder b)]) = _$MqttRfidAntennaCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttRfidAntennaCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttRfidAntennaCreate> get serializer => _$MqttRfidAntennaCreateSerializer();
}

class _$MqttRfidAntennaCreateSerializer implements PrimitiveSerializer<MqttRfidAntennaCreate> {
  @override
  final Iterable<Type> types = const [MqttRfidAntennaCreate, _$MqttRfidAntennaCreate];

  @override
  final String wireName = r'MqttRfidAntennaCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttRfidAntennaCreate object, {
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
    MqttRfidAntennaCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttRfidAntennaCreateBuilder result,
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
  MqttRfidAntennaCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttRfidAntennaCreateBuilder();
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

