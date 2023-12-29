//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/content_version_status.dart';
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/content_version_active_condition.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_version.g.dart';

/// Content version (e.g. language) of an exhibition.
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this page belongs to
/// * [name] - Human readable name of the content version
/// * [language] 
/// * [rooms] 
/// * [activeCondition] 
/// * [status] 
/// * [deviceGroupId] - Id of device group
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class ContentVersion implements Built<ContentVersion, ContentVersionBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Id of exhibition this page belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Human readable name of the content version
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'language')
  String get language;

  @BuiltValueField(wireName: r'rooms')
  BuiltList<String> get rooms;

  @BuiltValueField(wireName: r'activeCondition')
  ContentVersionActiveCondition? get activeCondition;

  @BuiltValueField(wireName: r'status')
  ContentVersionStatus? get status;
  // enum statusEnum {  notstarted,  inprogress,  ready,  };

  /// Id of device group
  @BuiltValueField(wireName: r'deviceGroupId')
  String? get deviceGroupId;

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

  ContentVersion._();

  factory ContentVersion([void updates(ContentVersionBuilder b)]) = _$ContentVersion;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContentVersionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContentVersion> get serializer => _$ContentVersionSerializer();
}

class _$ContentVersionSerializer implements PrimitiveSerializer<ContentVersion> {
  @override
  final Iterable<Type> types = const [ContentVersion, _$ContentVersion];

  @override
  final String wireName = r'ContentVersion';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContentVersion object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.exhibitionId != null) {
      yield r'exhibitionId';
      yield serializers.serialize(
        object.exhibitionId,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'language';
    yield serializers.serialize(
      object.language,
      specifiedType: const FullType(String),
    );
    yield r'rooms';
    yield serializers.serialize(
      object.rooms,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.activeCondition != null) {
      yield r'activeCondition';
      yield serializers.serialize(
        object.activeCondition,
        specifiedType: const FullType(ContentVersionActiveCondition),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ContentVersionStatus),
      );
    }
    if (object.deviceGroupId != null) {
      yield r'deviceGroupId';
      yield serializers.serialize(
        object.deviceGroupId,
        specifiedType: const FullType(String),
      );
    }
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
    ContentVersion object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ContentVersionBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.language = valueDes;
          break;
        case r'rooms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rooms.replace(valueDes);
          break;
        case r'activeCondition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentVersionActiveCondition),
          ) as ContentVersionActiveCondition;
          result.activeCondition.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentVersionStatus),
          ) as ContentVersionStatus;
          result.status = valueDes;
          break;
        case r'deviceGroupId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceGroupId = valueDes;
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
  ContentVersion deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContentVersionBuilder();
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

