//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/page_resource_mode.dart';
import 'package:noheva_api/src/model/exhibition_page_resource_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_page_resource.g.dart';

/// DevicePageResource
///
/// Properties:
/// * [id] - Resource id.
/// * [data] - Resource data. This is either string or an URL to resource data.
/// * [mode] 
/// * [type] 
/// * [component] - Name of the layout component this resource is attached to.
/// * [property] - Name of the property this resource is attached to. Property name be one of the following: - #text (element text content) - style-<style name> (element style) 
@BuiltValue()
abstract class DevicePageResource implements Built<DevicePageResource, DevicePageResourceBuilder> {
  /// Resource id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Resource data. This is either string or an URL to resource data.
  @BuiltValueField(wireName: r'data')
  String get data;

  @BuiltValueField(wireName: r'mode')
  PageResourceMode? get mode;
  // enum modeEnum {  static,  dynamic,  scripted,  };

  @BuiltValueField(wireName: r'type')
  ExhibitionPageResourceType get type;
  // enum typeEnum {  text,  image,  video,  html,  svg,  color,  };

  /// Name of the layout component this resource is attached to.
  @BuiltValueField(wireName: r'component')
  String? get component;

  /// Name of the property this resource is attached to. Property name be one of the following: - #text (element text content) - style-<style name> (element style) 
  @BuiltValueField(wireName: r'property')
  String? get property;

  DevicePageResource._();

  factory DevicePageResource([void updates(DevicePageResourceBuilder b)]) = _$DevicePageResource;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DevicePageResourceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DevicePageResource> get serializer => _$DevicePageResourceSerializer();
}

class _$DevicePageResourceSerializer implements PrimitiveSerializer<DevicePageResource> {
  @override
  final Iterable<Type> types = const [DevicePageResource, _$DevicePageResource];

  @override
  final String wireName = r'DevicePageResource';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DevicePageResource object, {
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
    if (object.component != null) {
      yield r'component';
      yield serializers.serialize(
        object.component,
        specifiedType: const FullType(String),
      );
    }
    if (object.property != null) {
      yield r'property';
      yield serializers.serialize(
        object.property,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DevicePageResource object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DevicePageResourceBuilder result,
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
        case r'component':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.component = valueDes;
          break;
        case r'property':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.property = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DevicePageResource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DevicePageResourceBuilder();
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

