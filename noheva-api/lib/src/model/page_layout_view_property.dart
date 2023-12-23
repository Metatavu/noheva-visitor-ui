//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/page_layout_view_property_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_layout_view_property.g.dart';

/// PageLayoutViewProperty
///
/// Properties:
/// * [name] 
/// * [value] 
/// * [type] 
@BuiltValue()
abstract class PageLayoutViewProperty implements Built<PageLayoutViewProperty, PageLayoutViewPropertyBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'value')
  String get value;

  @BuiltValueField(wireName: r'type')
  PageLayoutViewPropertyType get type;
  // enum typeEnum {  string,  boolean,  number,  color,  };

  PageLayoutViewProperty._();

  factory PageLayoutViewProperty([void updates(PageLayoutViewPropertyBuilder b)]) = _$PageLayoutViewProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageLayoutViewPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageLayoutViewProperty> get serializer => _$PageLayoutViewPropertySerializer();
}

class _$PageLayoutViewPropertySerializer implements PrimitiveSerializer<PageLayoutViewProperty> {
  @override
  final Iterable<Type> types = const [PageLayoutViewProperty, _$PageLayoutViewProperty];

  @override
  final String wireName = r'PageLayoutViewProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageLayoutViewProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(PageLayoutViewPropertyType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PageLayoutViewProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageLayoutViewPropertyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PageLayoutViewPropertyType),
          ) as PageLayoutViewPropertyType;
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
  PageLayoutViewProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageLayoutViewPropertyBuilder();
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

