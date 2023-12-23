//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/exhibition_page_resource.dart';
import 'package:noheva_api/src/model/exhibition_page_event_trigger.dart';
import 'package:noheva_api/src/model/exhibition_page_transition.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page.g.dart';

/// ExhibitionPage
///
/// Properties:
/// * [id] 
/// * [exhibitionId] - Id of exhibition this page belongs to
/// * [deviceId] - Id of device this page belongs to
/// * [layoutId] - Id of page layout
/// * [contentVersionId] - Id of content version
/// * [name] - Human readable name for the layout
/// * [resources] 
/// * [eventTriggers] 
/// * [enterTransitions] 
/// * [exitTransitions] 
/// * [orderNumber] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class ExhibitionPage implements Built<ExhibitionPage, ExhibitionPageBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Id of exhibition this page belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Id of device this page belongs to
  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  /// Id of page layout
  @BuiltValueField(wireName: r'layoutId')
  String get layoutId;

  /// Id of content version
  @BuiltValueField(wireName: r'contentVersionId')
  String get contentVersionId;

  /// Human readable name for the layout
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'resources')
  BuiltList<ExhibitionPageResource> get resources;

  @BuiltValueField(wireName: r'eventTriggers')
  BuiltList<ExhibitionPageEventTrigger> get eventTriggers;

  @BuiltValueField(wireName: r'enterTransitions')
  BuiltList<ExhibitionPageTransition> get enterTransitions;

  @BuiltValueField(wireName: r'exitTransitions')
  BuiltList<ExhibitionPageTransition> get exitTransitions;

  @BuiltValueField(wireName: r'orderNumber')
  int get orderNumber;

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

  ExhibitionPage._();

  factory ExhibitionPage([void updates(ExhibitionPageBuilder b)]) = _$ExhibitionPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPage> get serializer => _$ExhibitionPageSerializer();
}

class _$ExhibitionPageSerializer implements PrimitiveSerializer<ExhibitionPage> {
  @override
  final Iterable<Type> types = const [ExhibitionPage, _$ExhibitionPage];

  @override
  final String wireName = r'ExhibitionPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPage object, {
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
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
    yield r'layoutId';
    yield serializers.serialize(
      object.layoutId,
      specifiedType: const FullType(String),
    );
    yield r'contentVersionId';
    yield serializers.serialize(
      object.contentVersionId,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'resources';
    yield serializers.serialize(
      object.resources,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageResource)]),
    );
    yield r'eventTriggers';
    yield serializers.serialize(
      object.eventTriggers,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventTrigger)]),
    );
    yield r'enterTransitions';
    yield serializers.serialize(
      object.enterTransitions,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
    );
    yield r'exitTransitions';
    yield serializers.serialize(
      object.exitTransitions,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
    );
    yield r'orderNumber';
    yield serializers.serialize(
      object.orderNumber,
      specifiedType: const FullType(int),
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
    ExhibitionPage object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageBuilder result,
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
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        case r'layoutId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.layoutId = valueDes;
          break;
        case r'contentVersionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentVersionId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageResource)]),
          ) as BuiltList<ExhibitionPageResource>;
          result.resources.replace(valueDes);
          break;
        case r'eventTriggers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventTrigger)]),
          ) as BuiltList<ExhibitionPageEventTrigger>;
          result.eventTriggers.replace(valueDes);
          break;
        case r'enterTransitions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
          ) as BuiltList<ExhibitionPageTransition>;
          result.enterTransitions.replace(valueDes);
          break;
        case r'exitTransitions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
          ) as BuiltList<ExhibitionPageTransition>;
          result.exitTransitions.replace(valueDes);
          break;
        case r'orderNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.orderNumber = valueDes;
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
  ExhibitionPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageBuilder();
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

