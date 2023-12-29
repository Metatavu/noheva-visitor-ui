//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_proximity_update.g.dart';

/// MQTT message about tag proximity
///
/// Properties:
/// * [strength] 
/// * [tag] - Id of exhibition this visitor session belongs to
@BuiltValue()
abstract class MqttProximityUpdate implements Built<MqttProximityUpdate, MqttProximityUpdateBuilder> {
  @BuiltValueField(wireName: r'strength')
  double get strength;

  /// Id of exhibition this visitor session belongs to
  @BuiltValueField(wireName: r'tag')
  String get tag;

  MqttProximityUpdate._();

  factory MqttProximityUpdate([void updates(MqttProximityUpdateBuilder b)]) = _$MqttProximityUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttProximityUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttProximityUpdate> get serializer => _$MqttProximityUpdateSerializer();
}

class _$MqttProximityUpdateSerializer implements PrimitiveSerializer<MqttProximityUpdate> {
  @override
  final Iterable<Type> types = const [MqttProximityUpdate, _$MqttProximityUpdate];

  @override
  final String wireName = r'MqttProximityUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttProximityUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'strength';
    yield serializers.serialize(
      object.strength,
      specifiedType: const FullType(double),
    );
    yield r'tag';
    yield serializers.serialize(
      object.tag,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttProximityUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttProximityUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'strength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.strength = valueDes;
          break;
        case r'tag':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tag = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttProximityUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttProximityUpdateBuilder();
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

