//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'point.g.dart';

/// Describes a single point in a exhibition floor plan
///
/// Properties:
/// * [x] 
/// * [y] 
@BuiltValue()
abstract class Point implements Built<Point, PointBuilder> {
  @BuiltValueField(wireName: r'x')
  double? get x;

  @BuiltValueField(wireName: r'y')
  double? get y;

  Point._();

  factory Point([void updates(PointBuilder b)]) = _$Point;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PointBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Point> get serializer => _$PointSerializer();
}

class _$PointSerializer implements PrimitiveSerializer<Point> {
  @override
  final Iterable<Type> types = const [Point, _$Point];

  @override
  final String wireName = r'Point';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Point object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.x != null) {
      yield r'x';
      yield serializers.serialize(
        object.x,
        specifiedType: const FullType(double),
      );
    }
    if (object.y != null) {
      yield r'y';
      yield serializers.serialize(
        object.y,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Point object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PointBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.y = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Point deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PointBuilder();
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

