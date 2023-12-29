//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_exhibition_page_update.g.dart';

/// MQTT notification message about exhibition page update. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this page belongs to
@BuiltValue()
abstract class MqttExhibitionPageUpdate implements Built<MqttExhibitionPageUpdate, MqttExhibitionPageUpdateBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Id of exhibition this page belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  MqttExhibitionPageUpdate._();

  factory MqttExhibitionPageUpdate([void updates(MqttExhibitionPageUpdateBuilder b)]) = _$MqttExhibitionPageUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttExhibitionPageUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttExhibitionPageUpdate> get serializer => _$MqttExhibitionPageUpdateSerializer();
}

class _$MqttExhibitionPageUpdateSerializer implements PrimitiveSerializer<MqttExhibitionPageUpdate> {
  @override
  final Iterable<Type> types = const [MqttExhibitionPageUpdate, _$MqttExhibitionPageUpdate];

  @override
  final String wireName = r'MqttExhibitionPageUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttExhibitionPageUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.exhibitionId != null) {
      yield r'exhibitionId';
      yield serializers.serialize(
        object.exhibitionId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttExhibitionPageUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttExhibitionPageUpdateBuilder result,
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
  MqttExhibitionPageUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttExhibitionPageUpdateBuilder();
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

