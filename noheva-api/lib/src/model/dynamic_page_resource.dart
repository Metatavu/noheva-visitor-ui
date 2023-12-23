//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/dynamic_page_resource_type.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource.g.dart';

/// DynamicPageResource
///
/// Properties:
/// * [type] 
/// * [params] 
@BuiltValue()
abstract class DynamicPageResource implements Built<DynamicPageResource, DynamicPageResourceBuilder> {
  @BuiltValueField(wireName: r'type')
  DynamicPageResourceType? get type;
  // enum typeEnum {  switch,  substitute,  };

  @BuiltValueField(wireName: r'params')
  JsonObject? get params;

  DynamicPageResource._();

  factory DynamicPageResource([void updates(DynamicPageResourceBuilder b)]) = _$DynamicPageResource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DynamicPageResourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DynamicPageResource> get serializer => _$DynamicPageResourceSerializer();
}

class _$DynamicPageResourceSerializer implements PrimitiveSerializer<DynamicPageResource> {
  @override
  final Iterable<Type> types = const [DynamicPageResource, _$DynamicPageResource];

  @override
  final String wireName = r'DynamicPageResource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DynamicPageResource object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(DynamicPageResourceType),
      );
    }
    if (object.params != null) {
      yield r'params';
      yield serializers.serialize(
        object.params,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DynamicPageResource object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DynamicPageResourceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DynamicPageResourceType),
          ) as DynamicPageResourceType;
          result.type = valueDes;
          break;
        case r'params':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.params = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DynamicPageResource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DynamicPageResourceBuilder();
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

