//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_exhibition_visitor_session_create.g.dart';

/// MQTT notification message about exhibition visitor session creation. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this visitor session belongs to
@BuiltValue()
abstract class MqttExhibitionVisitorSessionCreate implements Built<MqttExhibitionVisitorSessionCreate, MqttExhibitionVisitorSessionCreateBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this visitor session belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttExhibitionVisitorSessionCreate._();

  factory MqttExhibitionVisitorSessionCreate([void updates(MqttExhibitionVisitorSessionCreateBuilder b)]) = _$MqttExhibitionVisitorSessionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttExhibitionVisitorSessionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttExhibitionVisitorSessionCreate> get serializer => _$MqttExhibitionVisitorSessionCreateSerializer();
}

class _$MqttExhibitionVisitorSessionCreateSerializer implements PrimitiveSerializer<MqttExhibitionVisitorSessionCreate> {
  @override
  final Iterable<Type> types = const [MqttExhibitionVisitorSessionCreate, _$MqttExhibitionVisitorSessionCreate];

  @override
  final String wireName = r'MqttExhibitionVisitorSessionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttExhibitionVisitorSessionCreate object, {
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
    MqttExhibitionVisitorSessionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttExhibitionVisitorSessionCreateBuilder result,
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
  MqttExhibitionVisitorSessionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttExhibitionVisitorSessionCreateBuilder();
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

