//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/group_content_version_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_content_version.g.dart';

/// Content version (e.g. language) of a device group.
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this group content version belongs to
/// * [name] - Human readable name of the group content version
/// * [status] 
/// * [contentVersionId] - Id of content version
/// * [deviceGroupId] - Id of device group
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class GroupContentVersion implements Built<GroupContentVersion, GroupContentVersionBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Id of exhibition this group content version belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Human readable name of the group content version
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'status')
  GroupContentVersionStatus get status;
  // enum statusEnum {  notstarted,  inprogress,  ready,  };

  /// Id of content version
  @BuiltValueField(wireName: r'contentVersionId')
  String get contentVersionId;

  /// Id of device group
  @BuiltValueField(wireName: r'deviceGroupId')
  String get deviceGroupId;

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

  GroupContentVersion._();

  factory GroupContentVersion([void updates(GroupContentVersionBuilder b)]) = _$GroupContentVersion;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GroupContentVersionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupContentVersion> get serializer => _$GroupContentVersionSerializer();
}

class _$GroupContentVersionSerializer implements PrimitiveSerializer<GroupContentVersion> {
  @override
  final Iterable<Type> types = const [GroupContentVersion, _$GroupContentVersion];

  @override
  final String wireName = r'GroupContentVersion';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GroupContentVersion object, {
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(GroupContentVersionStatus),
    );
    yield r'contentVersionId';
    yield serializers.serialize(
      object.contentVersionId,
      specifiedType: const FullType(String),
    );
    yield r'deviceGroupId';
    yield serializers.serialize(
      object.deviceGroupId,
      specifiedType: const FullType(String),
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
    GroupContentVersion object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GroupContentVersionBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GroupContentVersionStatus),
          ) as GroupContentVersionStatus;
          result.status = valueDes;
          break;
        case r'contentVersionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentVersionId = valueDes;
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
  GroupContentVersion deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupContentVersionBuilder();
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

