//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_version_active_condition.g.dart';

/// ContentVersionActiveCondition
///
/// Properties:
/// * [userVariable] 
/// * [equals] 
@BuiltValue()
abstract class ContentVersionActiveCondition implements Built<ContentVersionActiveCondition, ContentVersionActiveConditionBuilder> {
  @BuiltValueField(wireName: r'userVariable')
  String get userVariable;

  @BuiltValueField(wireName: r'equals')
  String? get equals;

  ContentVersionActiveCondition._();

  factory ContentVersionActiveCondition([void updates(ContentVersionActiveConditionBuilder b)]) = _$ContentVersionActiveCondition;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentVersionActiveConditionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentVersionActiveCondition> get serializer => _$ContentVersionActiveConditionSerializer();
}

class _$ContentVersionActiveConditionSerializer implements PrimitiveSerializer<ContentVersionActiveCondition> {
  @override
  final Iterable<Type> types = const [ContentVersionActiveCondition, _$ContentVersionActiveCondition];

  @override
  final String wireName = r'ContentVersionActiveCondition';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentVersionActiveCondition object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'userVariable';
    yield serializers.serialize(
      object.userVariable,
      specifiedType: const FullType(String),
    );
    if (object.equals != null) {
      yield r'equals';
      yield serializers.serialize(
        object.equals,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ContentVersionActiveCondition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ContentVersionActiveConditionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userVariable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userVariable = valueDes;
          break;
        case r'equals':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.equals = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContentVersionActiveCondition deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentVersionActiveConditionBuilder();
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

