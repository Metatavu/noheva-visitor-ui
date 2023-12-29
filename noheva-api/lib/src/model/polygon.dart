//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'polygon.g.dart';

/// GeoJson polygon object
///
/// Properties:
/// * [type] 
/// * [coordinates] - Polygon shapes
@BuiltValue()
abstract class Polygon implements Built<Polygon, PolygonBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  /// Polygon shapes
  @BuiltValueField(wireName: r'coordinates')
  BuiltList<BuiltList<BuiltList<double>>>? get coordinates;

  Polygon._();

  factory Polygon([void updates(PolygonBuilder b)]) = _$Polygon;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PolygonBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Polygon> get serializer => _$PolygonSerializer();
}

class _$PolygonSerializer implements PrimitiveSerializer<Polygon> {
  @override
  final Iterable<Type> types = const [Polygon, _$Polygon];

  @override
  final String wireName = r'Polygon';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Polygon object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.coordinates != null) {
      yield r'coordinates';
      yield serializers.serialize(
        object.coordinates,
        specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(BuiltList, [FullType(double)])])]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Polygon object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PolygonBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'coordinates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(BuiltList, [FullType(double)])])]),
          ) as BuiltList<BuiltList<BuiltList<double>>>;
          result.coordinates.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Polygon deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PolygonBuilder();
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

