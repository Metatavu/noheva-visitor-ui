//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_exhibition_visitor_session_update.g.dart';

/// MQTT notification message about exhibition visitor session update. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this visitor session belongs to
/// * [variablesChanged] - Whether session variables have changed
/// * [visitorsChanged] - Whether session visitors have changed
@BuiltValue()
abstract class MqttExhibitionVisitorSessionUpdate implements Built<MqttExhibitionVisitorSessionUpdate, MqttExhibitionVisitorSessionUpdateBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this visitor session belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  /// Whether session variables have changed
  @BuiltValueField(wireName: r'variablesChanged')
  bool get variablesChanged;

  /// Whether session visitors have changed
  @BuiltValueField(wireName: r'visitorsChanged')
  bool get visitorsChanged;

  MqttExhibitionVisitorSessionUpdate._();

  factory MqttExhibitionVisitorSessionUpdate([void updates(MqttExhibitionVisitorSessionUpdateBuilder b)]) = _$MqttExhibitionVisitorSessionUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttExhibitionVisitorSessionUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttExhibitionVisitorSessionUpdate> get serializer => _$MqttExhibitionVisitorSessionUpdateSerializer();
}

class _$MqttExhibitionVisitorSessionUpdateSerializer implements PrimitiveSerializer<MqttExhibitionVisitorSessionUpdate> {
  @override
  final Iterable<Type> types = const [MqttExhibitionVisitorSessionUpdate, _$MqttExhibitionVisitorSessionUpdate];

  @override
  final String wireName = r'MqttExhibitionVisitorSessionUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttExhibitionVisitorSessionUpdate object, {
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
    yield r'variablesChanged';
    yield serializers.serialize(
      object.variablesChanged,
      specifiedType: const FullType(bool),
    );
    yield r'visitorsChanged';
    yield serializers.serialize(
      object.visitorsChanged,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttExhibitionVisitorSessionUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttExhibitionVisitorSessionUpdateBuilder result,
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
        case r'variablesChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.variablesChanged = valueDes;
          break;
        case r'visitorsChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.visitorsChanged = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttExhibitionVisitorSessionUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttExhibitionVisitorSessionUpdateBuilder();
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

