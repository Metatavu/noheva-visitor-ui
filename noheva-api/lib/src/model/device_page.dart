//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/device_page_resource.dart';
import 'package:noheva_api/src/model/exhibition_page_event_trigger.dart';
import 'package:noheva_api/src/model/exhibition_page_transition.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_page.g.dart';

/// Read-only version of page, that is used to deliver page data to visitor ui devices.
///
/// Properties:
/// * [id] - Page id.
/// * [exhibitionId] - Id of exhibition this page belongs to
/// * [layoutId] - Id of page layout
/// * [name] - Human readable name for the page
/// * [resources] 
/// * [eventTriggers] 
/// * [enterTransitions] 
/// * [exitTransitions] 
/// * [orderNumber] 
/// * [language] - Language of the given page. Language is detected from content version this page belongs to.
/// * [activeConditionUserVariable] - Active condition user variable. This property is present only when page belongs to conditionally active content version.
/// * [activeConditionEquals] - Active condition equals value. This property is present only when page belongs to conditionally active content version.
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class DevicePage implements Built<DevicePage, DevicePageBuilder> {
  /// Page id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Id of exhibition this page belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  /// Id of page layout
  @BuiltValueField(wireName: r'layoutId')
  String get layoutId;

  /// Human readable name for the page
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'resources')
  BuiltList<DevicePageResource> get resources;

  @BuiltValueField(wireName: r'eventTriggers')
  BuiltList<ExhibitionPageEventTrigger>? get eventTriggers;

  @BuiltValueField(wireName: r'enterTransitions')
  BuiltList<ExhibitionPageTransition>? get enterTransitions;

  @BuiltValueField(wireName: r'exitTransitions')
  BuiltList<ExhibitionPageTransition>? get exitTransitions;

  @BuiltValueField(wireName: r'orderNumber')
  int get orderNumber;

  /// Language of the given page. Language is detected from content version this page belongs to.
  @BuiltValueField(wireName: r'language')
  String get language;

  /// Active condition user variable. This property is present only when page belongs to conditionally active content version.
  @BuiltValueField(wireName: r'activeConditionUserVariable')
  String? get activeConditionUserVariable;

  /// Active condition equals value. This property is present only when page belongs to conditionally active content version.
  @BuiltValueField(wireName: r'activeConditionEquals')
  String? get activeConditionEquals;

  /// Date modified
  @BuiltValueField(wireName: r'modifiedAt')
  DateTime get modifiedAt;

  DevicePage._();

  factory DevicePage([void updates(DevicePageBuilder b)]) = _$DevicePage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DevicePageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DevicePage> get serializer => _$DevicePageSerializer();
}

class _$DevicePageSerializer implements PrimitiveSerializer<DevicePage> {
  @override
  final Iterable<Type> types = const [DevicePage, _$DevicePage];

  @override
  final String wireName = r'DevicePage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DevicePage object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'exhibitionId';
    yield serializers.serialize(
      object.exhibitionId,
      specifiedType: const FullType(String),
    );
    yield r'layoutId';
    yield serializers.serialize(
      object.layoutId,
      specifiedType: const FullType(String),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    yield r'resources';
    yield serializers.serialize(
      object.resources,
      specifiedType: const FullType(BuiltList, [FullType(DevicePageResource)]),
    );
    if (object.eventTriggers != null) {
      yield r'eventTriggers';
      yield serializers.serialize(
        object.eventTriggers,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventTrigger)]),
      );
    }
    if (object.enterTransitions != null) {
      yield r'enterTransitions';
      yield serializers.serialize(
        object.enterTransitions,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
      );
    }
    if (object.exitTransitions != null) {
      yield r'exitTransitions';
      yield serializers.serialize(
        object.exitTransitions,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransition)]),
      );
    }
    yield r'orderNumber';
    yield serializers.serialize(
      object.orderNumber,
      specifiedType: const FullType(int),
    );
    yield r'language';
    yield serializers.serialize(
      object.language,
      specifiedType: const FullType(String),
    );
    if (object.activeConditionUserVariable != null) {
      yield r'activeConditionUserVariable';
      yield serializers.serialize(
        object.activeConditionUserVariable,
        specifiedType: const FullType(String),
      );
    }
    if (object.activeConditionEquals != null) {
      yield r'activeConditionEquals';
      yield serializers.serialize(
        object.activeConditionEquals,
        specifiedType: const FullType(String),
      );
    }
    yield r'modifiedAt';
    yield serializers.serialize(
      object.modifiedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DevicePage object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DevicePageBuilder result,
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
        case r'layoutId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.layoutId = valueDes;
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
            specifiedType: const FullType(BuiltList, [FullType(DevicePageResource)]),
          ) as BuiltList<DevicePageResource>;
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
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.language = valueDes;
          break;
        case r'activeConditionUserVariable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.activeConditionUserVariable = valueDes;
          break;
        case r'activeConditionEquals':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.activeConditionEquals = valueDes;
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
  DevicePage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DevicePageBuilder();
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

