//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_group_visitor_session_start_strategy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_device_group.g.dart';

/// ExhibitionDeviceGroup
///
/// Properties:
/// * [id] 
/// * [exhibitionId] 
/// * [roomId] 
/// * [name] 
/// * [allowVisitorSessionCreation] 
/// * [visitorSessionEndTimeout] - Timeout for visitor session
/// * [indexPageTimeout] - Time after inactive visitor will returned to the index page. Ignored if not specified
/// * [visitorSessionStartStrategy] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class ExhibitionDeviceGroup implements Built<ExhibitionDeviceGroup, ExhibitionDeviceGroupBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  @BuiltValueField(wireName: r'roomId')
  String? get roomId;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'allowVisitorSessionCreation')
  bool get allowVisitorSessionCreation;

  /// Timeout for visitor session
  @BuiltValueField(wireName: r'visitorSessionEndTimeout')
  int get visitorSessionEndTimeout;

  /// Time after inactive visitor will returned to the index page. Ignored if not specified
  @BuiltValueField(wireName: r'indexPageTimeout')
  int? get indexPageTimeout;

  @BuiltValueField(wireName: r'visitorSessionStartStrategy')
  DeviceGroupVisitorSessionStartStrategy get visitorSessionStartStrategy;
  // enum visitorSessionStartStrategyEnum {  othersblock,  endothers,  };

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

  ExhibitionDeviceGroup._();

  factory ExhibitionDeviceGroup([void updates(ExhibitionDeviceGroupBuilder b)]) = _$ExhibitionDeviceGroup;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionDeviceGroupBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionDeviceGroup> get serializer => _$ExhibitionDeviceGroupSerializer();
}

class _$ExhibitionDeviceGroupSerializer implements PrimitiveSerializer<ExhibitionDeviceGroup> {
  @override
  final Iterable<Type> types = const [ExhibitionDeviceGroup, _$ExhibitionDeviceGroup];

  @override
  final String wireName = r'ExhibitionDeviceGroup';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionDeviceGroup object, {
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
    if (object.roomId != null) {
      yield r'roomId';
      yield serializers.serialize(
        object.roomId,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'allowVisitorSessionCreation';
    yield serializers.serialize(
      object.allowVisitorSessionCreation,
      specifiedType: const FullType(bool),
    );
    yield r'visitorSessionEndTimeout';
    yield serializers.serialize(
      object.visitorSessionEndTimeout,
      specifiedType: const FullType(int),
    );
    if (object.indexPageTimeout != null) {
      yield r'indexPageTimeout';
      yield serializers.serialize(
        object.indexPageTimeout,
        specifiedType: const FullType(int),
      );
    }
    yield r'visitorSessionStartStrategy';
    yield serializers.serialize(
      object.visitorSessionStartStrategy,
      specifiedType: const FullType(DeviceGroupVisitorSessionStartStrategy),
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
    ExhibitionDeviceGroup object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionDeviceGroupBuilder result,
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
        case r'roomId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'allowVisitorSessionCreation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.allowVisitorSessionCreation = valueDes;
          break;
        case r'visitorSessionEndTimeout':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.visitorSessionEndTimeout = valueDes;
          break;
        case r'indexPageTimeout':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.indexPageTimeout = valueDes;
          break;
        case r'visitorSessionStartStrategy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceGroupVisitorSessionStartStrategy),
          ) as DeviceGroupVisitorSessionStartStrategy;
          result.visitorSessionStartStrategy = valueDes;
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
  ExhibitionDeviceGroup deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionDeviceGroupBuilder();
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

