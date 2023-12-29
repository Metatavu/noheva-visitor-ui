//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/exhibition_page_event_property.dart';
import 'package:noheva_api/src/model/exhibition_page_event_action_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event.g.dart';

/// ExhibitionPageEvent
///
/// Properties:
/// * [action] 
/// * [properties] 
@BuiltValue()
abstract class ExhibitionPageEvent implements Built<ExhibitionPageEvent, ExhibitionPageEventBuilder> {
  @BuiltValueField(wireName: r'action')
  ExhibitionPageEventActionType get action;
  // enum actionEnum {  hide,  show,  setuservalue,  navigate,  setsrc,  settext,  triggerdevicegroupevent,  executeWebScript,  visitorSessionEnd,  startVisitorSession,  };

  @BuiltValueField(wireName: r'properties')
  BuiltList<ExhibitionPageEventProperty> get properties;

  ExhibitionPageEvent._();

  factory ExhibitionPageEvent([void updates(ExhibitionPageEventBuilder b)]) = _$ExhibitionPageEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageEvent> get serializer => _$ExhibitionPageEventSerializer();
}

class _$ExhibitionPageEventSerializer implements PrimitiveSerializer<ExhibitionPageEvent> {
  @override
  final Iterable<Type> types = const [ExhibitionPageEvent, _$ExhibitionPageEvent];

  @override
  final String wireName = r'ExhibitionPageEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'action';
    yield serializers.serialize(
      object.action,
      specifiedType: const FullType(ExhibitionPageEventActionType),
    );
    yield r'properties';
    yield serializers.serialize(
      object.properties,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventProperty)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExhibitionPageEventActionType),
          ) as ExhibitionPageEventActionType;
          result.action = valueDes;
          break;
        case r'properties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageEventProperty)]),
          ) as BuiltList<ExhibitionPageEventProperty>;
          result.properties.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageEventBuilder();
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

