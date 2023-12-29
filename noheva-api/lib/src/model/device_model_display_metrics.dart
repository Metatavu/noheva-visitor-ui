//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_model_display_metrics.g.dart';

/// Describes device display information
///
/// Properties:
/// * [heightPixels] 
/// * [widthPixels] 
/// * [density] 
/// * [xdpi] 
/// * [ydpi] 
@BuiltValue()
abstract class DeviceModelDisplayMetrics implements Built<DeviceModelDisplayMetrics, DeviceModelDisplayMetricsBuilder> {
  @BuiltValueField(wireName: r'heightPixels')
  int? get heightPixels;

  @BuiltValueField(wireName: r'widthPixels')
  int? get widthPixels;

  @BuiltValueField(wireName: r'density')
  double? get density;

  @BuiltValueField(wireName: r'xdpi')
  double? get xdpi;

  @BuiltValueField(wireName: r'ydpi')
  double? get ydpi;

  DeviceModelDisplayMetrics._();

  factory DeviceModelDisplayMetrics([void updates(DeviceModelDisplayMetricsBuilder b)]) = _$DeviceModelDisplayMetrics;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceModelDisplayMetricsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceModelDisplayMetrics> get serializer => _$DeviceModelDisplayMetricsSerializer();
}

class _$DeviceModelDisplayMetricsSerializer implements PrimitiveSerializer<DeviceModelDisplayMetrics> {
  @override
  final Iterable<Type> types = const [DeviceModelDisplayMetrics, _$DeviceModelDisplayMetrics];

  @override
  final String wireName = r'DeviceModelDisplayMetrics';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceModelDisplayMetrics object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.heightPixels != null) {
      yield r'heightPixels';
      yield serializers.serialize(
        object.heightPixels,
        specifiedType: const FullType(int),
      );
    }
    if (object.widthPixels != null) {
      yield r'widthPixels';
      yield serializers.serialize(
        object.widthPixels,
        specifiedType: const FullType(int),
      );
    }
    if (object.density != null) {
      yield r'density';
      yield serializers.serialize(
        object.density,
        specifiedType: const FullType(double),
      );
    }
    if (object.xdpi != null) {
      yield r'xdpi';
      yield serializers.serialize(
        object.xdpi,
        specifiedType: const FullType(double),
      );
    }
    if (object.ydpi != null) {
      yield r'ydpi';
      yield serializers.serialize(
        object.ydpi,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceModelDisplayMetrics object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceModelDisplayMetricsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'heightPixels':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.heightPixels = valueDes;
          break;
        case r'widthPixels':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.widthPixels = valueDes;
          break;
        case r'density':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.density = valueDes;
          break;
        case r'xdpi':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.xdpi = valueDes;
          break;
        case r'ydpi':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.ydpi = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceModelDisplayMetrics deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceModelDisplayMetricsBuilder();
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

