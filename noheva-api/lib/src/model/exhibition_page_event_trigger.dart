//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/exhibition_page_event.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event_trigger.g.dart';

/// ExhibitionPageEventTrigger
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [events] 
/// * [delay] 
/// * [clickViewId] 
/// * [deviceGroupEvent] - Name of triggering device group event
/// * [keyUp] 
/// * [keyDown] 
/// * [next] 
@BuiltValue()
abstract class ExhibitionPageEventTrigger implements Built<ExhibitionPageEventTrigger, ExhibitionPageEventTriggerBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'events')
  BuiltList<ExhibitionPageEvent>? get events;

  @BuiltValueField(wireName: r'delay')
  int? get delay;

  @BuiltValueField(wireName: r'clickViewId')
  String? get clickViewId;

  /// Name of triggering device group event
  @BuiltValueField(wireName: r'deviceGroupEvent')
  String? get deviceGroupEvent;

  @BuiltValueField(wireName: r'keyUp')
  String? get keyUp;

  @BuiltValueField(wireName: r'keyDown')
  String? get keyDown;

  @BuiltValueField(wireName: r'next')
  BuiltList<ExhibitionPageEventTrigger>? get next;

  ExhibitionPageEventTrigger._();

  factory ExhibitionPageEventTrigger([void updates(ExhibitionPageEventTriggerBuilder b)]) = _$ExhibitionPageEventTrigger;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageEventTriggerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageEventTrigger> get serializer => _$ExhibitionPageEventTriggerSerializer();
}

class _$ExhibitionPageEventTriggerSerializer implements PrimitiveSerializer<ExhibitionPageEventTrigger> {
  @override
  final Iterable<Type> types = const [ExhibitionPageEventTrigger, _$ExhibitionPageEventTrigger];

  @override
  final String wireName = r'ExhibitionPageEventTrigger';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageEventTrigger object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.events != null) {
      yield r'events';
      yield serializers.serialize(
        object.events,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEvent)]),
      );
    }
    if (object.delay != null) {
      yield r'delay';
      yield serializers.serialize(
        object.delay,
        specifiedType: const FullType(int),
      );
    }
    if (object.clickViewId != null) {
      yield r'clickViewId';
      yield serializers.serialize(
        object.clickViewId,
        specifiedType: const FullType(String),
      );
    }
    if (object.deviceGroupEvent != null) {
      yield r'deviceGroupEvent';
      yield serializers.serialize(
        object.deviceGroupEvent,
        specifiedType: const FullType(String),
      );
    }
    if (object.keyUp != null) {
      yield r'keyUp';
      yield serializers.serialize(
        object.keyUp,
        specifiedType: const FullType(String),
      );
    }
    if (object.keyDown != null) {
      yield r'keyDown';
      yield serializers.serialize(
        object.keyDown,
        specifiedType: const FullType(String),
      );
    }
    if (object.next != null) {
      yield r'next';
      yield serializers.serialize(
        object.next,
        specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventTrigger)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageEventTrigger object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageEventTriggerBuilder result,
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
        case r'events':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEvent)]),
          ) as BuiltList<ExhibitionPageEvent>;
          result.events.replace(valueDes);
          break;
        case r'delay':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.delay = valueDes;
          break;
        case r'clickViewId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clickViewId = valueDes;
          break;
        case r'deviceGroupEvent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceGroupEvent = valueDes;
          break;
        case r'keyUp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.keyUp = valueDes;
          break;
        case r'keyDown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.keyDown = valueDes;
          break;
        case r'next':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventTrigger)]),
          ) as BuiltList<ExhibitionPageEventTrigger>;
          result.next.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageEventTrigger deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageEventTriggerBuilder();
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

