//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_substitute_substitute_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource_substitute.g.dart';

/// DynamicPageResourceSubstitute
///
/// Properties:
/// * [input] - input text
/// * [substitute] 
@BuiltValue()
abstract class DynamicPageResourceSubstitute implements Built<DynamicPageResourceSubstitute, DynamicPageResourceSubstituteBuilder> {
  /// input text
  @BuiltValueField(wireName: r'input')
  String get input;

  @BuiltValueField(wireName: r'substitute')
  BuiltList<DynamicPageResourceSubstituteSubstituteInner> get substitute;

  DynamicPageResourceSubstitute._();

  factory DynamicPageResourceSubstitute([void updates(DynamicPageResourceSubstituteBuilder b)]) = _$DynamicPageResourceSubstitute;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DynamicPageResourceSubstituteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DynamicPageResourceSubstitute> get serializer => _$DynamicPageResourceSubstituteSerializer();
}

class _$DynamicPageResourceSubstituteSerializer implements PrimitiveSerializer<DynamicPageResourceSubstitute> {
  @override
  final Iterable<Type> types = const [DynamicPageResourceSubstitute, _$DynamicPageResourceSubstitute];

  @override
  final String wireName = r'DynamicPageResourceSubstitute';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DynamicPageResourceSubstitute object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'input';
    yield serializers.serialize(
      object.input,
      specifiedType: const FullType(String),
    );
    yield r'substitute';
    yield serializers.serialize(
      object.substitute,
      specifiedType: const FullType(BuiltList, [FullType(DynamicPageResourceSubstituteSubstituteInner)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DynamicPageResourceSubstitute object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DynamicPageResourceSubstituteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'input':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.input = valueDes;
          break;
        case r'substitute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DynamicPageResourceSubstituteSubstituteInner)]),
          ) as BuiltList<DynamicPageResourceSubstituteSubstituteInner>;
          result.substitute.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DynamicPageResourceSubstitute deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DynamicPageResourceSubstituteBuilder();
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

