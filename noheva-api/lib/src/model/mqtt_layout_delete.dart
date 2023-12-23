//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_layout_delete.g.dart';

/// MQTT notification message about layout deletion. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class MqttLayoutDelete implements Built<MqttLayoutDelete, MqttLayoutDeleteBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  MqttLayoutDelete._();

  factory MqttLayoutDelete([void updates(MqttLayoutDeleteBuilder b)]) = _$MqttLayoutDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttLayoutDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttLayoutDelete> get serializer => _$MqttLayoutDeleteSerializer();
}

class _$MqttLayoutDeleteSerializer implements PrimitiveSerializer<MqttLayoutDelete> {
  @override
  final Iterable<Type> types = const [MqttLayoutDelete, _$MqttLayoutDelete];

  @override
  final String wireName = r'MqttLayoutDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttLayoutDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttLayoutDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttLayoutDeleteBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttLayoutDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttLayoutDeleteBuilder();
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

