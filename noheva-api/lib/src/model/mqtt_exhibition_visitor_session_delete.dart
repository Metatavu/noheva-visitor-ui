//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_exhibition_visitor_session_delete.g.dart';

/// MQTT notification message about exhibition visitor session deletion. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this visitor session belongs to
@BuiltValue()
abstract class MqttExhibitionVisitorSessionDelete implements Built<MqttExhibitionVisitorSessionDelete, MqttExhibitionVisitorSessionDeleteBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this visitor session belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  MqttExhibitionVisitorSessionDelete._();

  factory MqttExhibitionVisitorSessionDelete([void updates(MqttExhibitionVisitorSessionDeleteBuilder b)]) = _$MqttExhibitionVisitorSessionDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttExhibitionVisitorSessionDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttExhibitionVisitorSessionDelete> get serializer => _$MqttExhibitionVisitorSessionDeleteSerializer();
}

class _$MqttExhibitionVisitorSessionDeleteSerializer implements PrimitiveSerializer<MqttExhibitionVisitorSessionDelete> {
  @override
  final Iterable<Type> types = const [MqttExhibitionVisitorSessionDelete, _$MqttExhibitionVisitorSessionDelete];

  @override
  final String wireName = r'MqttExhibitionVisitorSessionDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttExhibitionVisitorSessionDelete object, {
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
    MqttExhibitionVisitorSessionDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttExhibitionVisitorSessionDeleteBuilder result,
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
  MqttExhibitionVisitorSessionDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttExhibitionVisitorSessionDeleteBuilder();
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

