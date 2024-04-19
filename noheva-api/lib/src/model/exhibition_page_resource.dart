//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/page_resource_mode.dart';
import 'package:noheva_api/src/model/exhibition_page_resource_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_resource.g.dart';

/// ExhibitionPageResource
///
/// Properties:
/// * [id] 
/// * [data] 
/// * [mode] 
/// * [type] 
@BuiltValue()
abstract class ExhibitionPageResource implements Built<ExhibitionPageResource, ExhibitionPageResourceBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'data')
  String get data;

  @BuiltValueField(wireName: r'mode')
  PageResourceMode? get mode;
  // enum modeEnum {  static,  dynamic,  scripted,  };

  @BuiltValueField(wireName: r'type')
  ExhibitionPageResourceType get type;
  // enum typeEnum {  text,  image,  video,  html,  svg,  color,  };

  ExhibitionPageResource._();

  factory ExhibitionPageResource([void updates(ExhibitionPageResourceBuilder b)]) = _$ExhibitionPageResource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageResourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageResource> get serializer => _$ExhibitionPageResourceSerializer();
}

class _$ExhibitionPageResourceSerializer implements PrimitiveSerializer<ExhibitionPageResource> {
  @override
  final Iterable<Type> types = const [ExhibitionPageResource, _$ExhibitionPageResource];

  @override
  final String wireName = r'ExhibitionPageResource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageResource object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(String),
    );
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(PageResourceMode),
      );
    }
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(ExhibitionPageResourceType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageResource object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageResourceBuilder result,
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
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.data = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PageResourceMode),
          ) as PageResourceMode;
          result.mode = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExhibitionPageResourceType),
          ) as ExhibitionPageResourceType;
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
  ExhibitionPageResource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageResourceBuilder();
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

