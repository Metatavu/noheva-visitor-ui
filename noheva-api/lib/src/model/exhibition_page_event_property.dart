//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/exhibition_page_event_property_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event_property.g.dart';

/// ExhibitionPageEventProperty
///
/// Properties:
/// * [name] 
/// * [value] 
/// * [type] 
@BuiltValue()
abstract class ExhibitionPageEventProperty implements Built<ExhibitionPageEventProperty, ExhibitionPageEventPropertyBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'value')
  String get value;

  @BuiltValueField(wireName: r'type')
  ExhibitionPageEventPropertyType get type;
  // enum typeEnum {  string,  boolean,  number,  color,  };

  ExhibitionPageEventProperty._();

  factory ExhibitionPageEventProperty([void updates(ExhibitionPageEventPropertyBuilder b)]) = _$ExhibitionPageEventProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageEventPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageEventProperty> get serializer => _$ExhibitionPageEventPropertySerializer();
}

class _$ExhibitionPageEventPropertySerializer implements PrimitiveSerializer<ExhibitionPageEventProperty> {
  @override
  final Iterable<Type> types = const [ExhibitionPageEventProperty, _$ExhibitionPageEventProperty];

  @override
  final String wireName = r'ExhibitionPageEventProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageEventProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(ExhibitionPageEventPropertyType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageEventProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageEventPropertyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExhibitionPageEventPropertyType),
          ) as ExhibitionPageEventPropertyType;
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
  ExhibitionPageEventProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageEventPropertyBuilder();
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

