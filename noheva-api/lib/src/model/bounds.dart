//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/coordinates.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bounds.g.dart';

/// Geo bounds object
///
/// Properties:
/// * [southWestCorner] 
/// * [northEastCorner] 
@BuiltValue()
abstract class Bounds implements Built<Bounds, BoundsBuilder> {
  @BuiltValueField(wireName: r'southWestCorner')
  Coordinates get southWestCorner;

  @BuiltValueField(wireName: r'northEastCorner')
  Coordinates get northEastCorner;

  Bounds._();

  factory Bounds([void updates(BoundsBuilder b)]) = _$Bounds;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoundsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Bounds> get serializer => _$BoundsSerializer();
}

class _$BoundsSerializer implements PrimitiveSerializer<Bounds> {
  @override
  final Iterable<Type> types = const [Bounds, _$Bounds];

  @override
  final String wireName = r'Bounds';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Bounds object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'southWestCorner';
    yield serializers.serialize(
      object.southWestCorner,
      specifiedType: const FullType(Coordinates),
    );
    yield r'northEastCorner';
    yield serializers.serialize(
      object.northEastCorner,
      specifiedType: const FullType(Coordinates),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Bounds object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BoundsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'southWestCorner':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Coordinates),
          ) as Coordinates;
          result.southWestCorner.replace(valueDes);
          break;
        case r'northEastCorner':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Coordinates),
          ) as Coordinates;
          result.northEastCorner.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Bounds deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoundsBuilder();
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

