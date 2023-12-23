//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_layout_update.g.dart';

/// MQTT notification message about layout update. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class MqttLayoutUpdate implements Built<MqttLayoutUpdate, MqttLayoutUpdateBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  MqttLayoutUpdate._();

  factory MqttLayoutUpdate([void updates(MqttLayoutUpdateBuilder b)]) = _$MqttLayoutUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttLayoutUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttLayoutUpdate> get serializer => _$MqttLayoutUpdateSerializer();
}

class _$MqttLayoutUpdateSerializer implements PrimitiveSerializer<MqttLayoutUpdate> {
  @override
  final Iterable<Type> types = const [MqttLayoutUpdate, _$MqttLayoutUpdate];

  @override
  final String wireName = r'MqttLayoutUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttLayoutUpdate object, {
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
    MqttLayoutUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttLayoutUpdateBuilder result,
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
  MqttLayoutUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttLayoutUpdateBuilder();
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

