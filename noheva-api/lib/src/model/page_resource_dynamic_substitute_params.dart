//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_resource_dynamic_substitute_params.g.dart';

/// PageResourceDynamicSubstituteParams
///
/// Properties:
/// * [type] - name of triggered event
@BuiltValue()
abstract class PageResourceDynamicSubstituteParams implements Built<PageResourceDynamicSubstituteParams, PageResourceDynamicSubstituteParamsBuilder> {
  /// name of triggered event
  @BuiltValueField(wireName: r'type')
  String get type;

  PageResourceDynamicSubstituteParams._();

  factory PageResourceDynamicSubstituteParams([void updates(PageResourceDynamicSubstituteParamsBuilder b)]) = _$PageResourceDynamicSubstituteParams;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageResourceDynamicSubstituteParamsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageResourceDynamicSubstituteParams> get serializer => _$PageResourceDynamicSubstituteParamsSerializer();
}

class _$PageResourceDynamicSubstituteParamsSerializer implements PrimitiveSerializer<PageResourceDynamicSubstituteParams> {
  @override
  final Iterable<Type> types = const [PageResourceDynamicSubstituteParams, _$PageResourceDynamicSubstituteParams];

  @override
  final String wireName = r'PageResourceDynamicSubstituteParams';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageResourceDynamicSubstituteParams object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PageResourceDynamicSubstituteParams object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageResourceDynamicSubstituteParamsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PageResourceDynamicSubstituteParams deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageResourceDynamicSubstituteParamsBuilder();
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

