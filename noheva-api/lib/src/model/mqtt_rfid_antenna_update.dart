//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_rfid_antenna_update.g.dart';

/// MQTT notification message about RFID antenna update. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this RFID antenna belongs to
/// * [groupChanged] - Whether antenna device group has changed
@BuiltValue()
abstract class MqttRfidAntennaUpdate implements Built<MqttRfidAntennaUpdate, MqttRfidAntennaUpdateBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this RFID antenna belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  /// Whether antenna device group has changed
  @BuiltValueField(wireName: r'groupChanged')
  bool? get groupChanged;

  MqttRfidAntennaUpdate._();

  factory MqttRfidAntennaUpdate([void updates(MqttRfidAntennaUpdateBuilder b)]) = _$MqttRfidAntennaUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttRfidAntennaUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttRfidAntennaUpdate> get serializer => _$MqttRfidAntennaUpdateSerializer();
}

class _$MqttRfidAntennaUpdateSerializer implements PrimitiveSerializer<MqttRfidAntennaUpdate> {
  @override
  final Iterable<Type> types = const [MqttRfidAntennaUpdate, _$MqttRfidAntennaUpdate];

  @override
  final String wireName = r'MqttRfidAntennaUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttRfidAntennaUpdate object, {
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
    if (object.groupChanged != null) {
      yield r'groupChanged';
      yield serializers.serialize(
        object.groupChanged,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttRfidAntennaUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttRfidAntennaUpdateBuilder result,
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
        case r'groupChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.groupChanged = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttRfidAntennaUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttRfidAntennaUpdateBuilder();
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

