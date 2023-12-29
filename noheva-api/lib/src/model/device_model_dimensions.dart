//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_model_dimensions.g.dart';

/// Describes device model physical dimensions
///
/// Properties:
/// * [deviceWidth] 
/// * [deviceHeight] 
/// * [deviceDepth] 
/// * [screenWidth] 
/// * [screenHeight] 
@BuiltValue()
abstract class DeviceModelDimensions implements Built<DeviceModelDimensions, DeviceModelDimensionsBuilder> {
  @BuiltValueField(wireName: r'deviceWidth')
  double? get deviceWidth;

  @BuiltValueField(wireName: r'deviceHeight')
  double? get deviceHeight;

  @BuiltValueField(wireName: r'deviceDepth')
  double? get deviceDepth;

  @BuiltValueField(wireName: r'screenWidth')
  double? get screenWidth;

  @BuiltValueField(wireName: r'screenHeight')
  double? get screenHeight;

  DeviceModelDimensions._();

  factory DeviceModelDimensions([void updates(DeviceModelDimensionsBuilder b)]) = _$DeviceModelDimensions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceModelDimensionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceModelDimensions> get serializer => _$DeviceModelDimensionsSerializer();
}

class _$DeviceModelDimensionsSerializer implements PrimitiveSerializer<DeviceModelDimensions> {
  @override
  final Iterable<Type> types = const [DeviceModelDimensions, _$DeviceModelDimensions];

  @override
  final String wireName = r'DeviceModelDimensions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceModelDimensions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.deviceWidth != null) {
      yield r'deviceWidth';
      yield serializers.serialize(
        object.deviceWidth,
        specifiedType: const FullType(double),
      );
    }
    if (object.deviceHeight != null) {
      yield r'deviceHeight';
      yield serializers.serialize(
        object.deviceHeight,
        specifiedType: const FullType(double),
      );
    }
    if (object.deviceDepth != null) {
      yield r'deviceDepth';
      yield serializers.serialize(
        object.deviceDepth,
        specifiedType: const FullType(double),
      );
    }
    if (object.screenWidth != null) {
      yield r'screenWidth';
      yield serializers.serialize(
        object.screenWidth,
        specifiedType: const FullType(double),
      );
    }
    if (object.screenHeight != null) {
      yield r'screenHeight';
      yield serializers.serialize(
        object.screenHeight,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceModelDimensions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceModelDimensionsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceWidth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.deviceWidth = valueDes;
          break;
        case r'deviceHeight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.deviceHeight = valueDes;
          break;
        case r'deviceDepth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.deviceDepth = valueDes;
          break;
        case r'screenWidth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.screenWidth = valueDes;
          break;
        case r'screenHeight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.screenHeight = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceModelDimensions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceModelDimensionsBuilder();
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

