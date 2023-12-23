//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/layout_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/exhibition_page_resource.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_layout.g.dart';

/// Describes a sub layout for a page
///
/// Properties:
/// * [id] 
/// * [name] - Human readable name for the sub layout
/// * [data] - Page layout data which can be either PageLayoutViewHtml or PageLayoutView
/// * [defaultResources] 
/// * [layoutType] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class SubLayout implements Built<SubLayout, SubLayoutBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Human readable name for the sub layout
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Page layout data which can be either PageLayoutViewHtml or PageLayoutView
  @BuiltValueField(wireName: r'data')
  JsonObject get data;

  @BuiltValueField(wireName: r'defaultResources')
  BuiltList<ExhibitionPageResource>? get defaultResources;

  @BuiltValueField(wireName: r'layoutType')
  LayoutType get layoutType;
  // enum layoutTypeEnum {  ANDROID,  HTML,  };

  @BuiltValueField(wireName: r'creatorId')
  String? get creatorId;

  @BuiltValueField(wireName: r'lastModifierId')
  String? get lastModifierId;

  /// Created date
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  /// Date modified
  @BuiltValueField(wireName: r'modifiedAt')
  DateTime? get modifiedAt;

  SubLayout._();

  factory SubLayout([void updates(SubLayoutBuilder b)]) = _$SubLayout;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubLayoutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubLayout> get serializer => _$SubLayoutSerializer();
}

class _$SubLayoutSerializer implements PrimitiveSerializer<SubLayout> {
  @override
  final Iterable<Type> types = const [SubLayout, _$SubLayout];

  @override
  final String wireName = r'SubLayout';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubLayout object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(JsonObject),
    );
    if (object.defaultResources != null) {
      yield r'defaultResources';
      yield serializers.serialize(
        object.defaultResources,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageResource)]),
      );
    }
    yield r'layoutType';
    yield serializers.serialize(
      object.layoutType,
      specifiedType: const FullType(LayoutType),
    );
    if (object.creatorId != null) {
      yield r'creatorId';
      yield serializers.serialize(
        object.creatorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.lastModifierId != null) {
      yield r'lastModifierId';
      yield serializers.serialize(
        object.lastModifierId,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.modifiedAt != null) {
      yield r'modifiedAt';
      yield serializers.serialize(
        object.modifiedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubLayout object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubLayoutBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.data = valueDes;
          break;
        case r'defaultResources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageResource)]),
          ) as BuiltList<ExhibitionPageResource>;
          result.defaultResources.replace(valueDes);
          break;
        case r'layoutType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LayoutType),
          ) as LayoutType;
          result.layoutType = valueDes;
          break;
        case r'creatorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.creatorId = valueDes;
          break;
        case r'lastModifierId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastModifierId = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'modifiedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.modifiedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubLayout deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubLayoutBuilder();
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

