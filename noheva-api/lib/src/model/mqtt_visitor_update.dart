//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_visitor_update.g.dart';

/// MQTT notification message about exhibition visitor update. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this visitor belongs to
@BuiltValue()
abstract class MqttVisitorUpdate implements Built<MqttVisitorUpdate, MqttVisitorUpdateBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this visitor belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttVisitorUpdate._();

  factory MqttVisitorUpdate([void updates(MqttVisitorUpdateBuilder b)]) = _$MqttVisitorUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttVisitorUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttVisitorUpdate> get serializer => _$MqttVisitorUpdateSerializer();
}

class _$MqttVisitorUpdateSerializer implements PrimitiveSerializer<MqttVisitorUpdate> {
  @override
  final Iterable<Type> types = const [MqttVisitorUpdate, _$MqttVisitorUpdate];

  @override
  final String wireName = r'MqttVisitorUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttVisitorUpdate object, {
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
    MqttVisitorUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttVisitorUpdateBuilder result,
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
  MqttVisitorUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttVisitorUpdateBuilder();
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

