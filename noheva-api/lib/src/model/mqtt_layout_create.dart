//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_layout_create.g.dart';

/// MQTT notification message about layout creation. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class MqttLayoutCreate implements Built<MqttLayoutCreate, MqttLayoutCreateBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  MqttLayoutCreate._();

  factory MqttLayoutCreate([void updates(MqttLayoutCreateBuilder b)]) = _$MqttLayoutCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttLayoutCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttLayoutCreate> get serializer => _$MqttLayoutCreateSerializer();
}

class _$MqttLayoutCreateSerializer implements PrimitiveSerializer<MqttLayoutCreate> {
  @override
  final Iterable<Type> types = const [MqttLayoutCreate, _$MqttLayoutCreate];

  @override
  final String wireName = r'MqttLayoutCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttLayoutCreate object, {
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
    MqttLayoutCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttLayoutCreateBuilder result,
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
  MqttLayoutCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttLayoutCreateBuilder();
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

