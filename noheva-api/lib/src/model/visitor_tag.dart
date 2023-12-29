//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_tag.g.dart';

/// VisitorTag
///
/// Properties:
/// * [tagId] 
@BuiltValue()
abstract class VisitorTag implements Built<VisitorTag, VisitorTagBuilder> {
  @BuiltValueField(wireName: r'tagId')
  String get tagId;

  VisitorTag._();

  factory VisitorTag([void updates(VisitorTagBuilder b)]) = _$VisitorTag;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorTagBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisitorTag> get serializer => _$VisitorTagSerializer();
}

class _$VisitorTagSerializer implements PrimitiveSerializer<VisitorTag> {
  @override
  final Iterable<Type> types = const [VisitorTag, _$VisitorTag];

  @override
  final String wireName = r'VisitorTag';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisitorTag object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'tagId';
    yield serializers.serialize(
      object.tagId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VisitorTag object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorTagBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tagId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tagId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VisitorTag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorTagBuilder();
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

