//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_model_capabilities.g.dart';

/// Describes device model capabilities
///
/// Properties:
/// * [touch] - Whether device supports touching
@BuiltValue()
abstract class DeviceModelCapabilities implements Built<DeviceModelCapabilities, DeviceModelCapabilitiesBuilder> {
  /// Whether device supports touching
  @BuiltValueField(wireName: r'touch')
  bool get touch;

  DeviceModelCapabilities._();

  factory DeviceModelCapabilities([void updates(DeviceModelCapabilitiesBuilder b)]) = _$DeviceModelCapabilities;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceModelCapabilitiesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceModelCapabilities> get serializer => _$DeviceModelCapabilitiesSerializer();
}

class _$DeviceModelCapabilitiesSerializer implements PrimitiveSerializer<DeviceModelCapabilities> {
  @override
  final Iterable<Type> types = const [DeviceModelCapabilities, _$DeviceModelCapabilities];

  @override
  final String wireName = r'DeviceModelCapabilities';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceModelCapabilities object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'touch';
    yield serializers.serialize(
      object.touch,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceModelCapabilities object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceModelCapabilitiesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'touch':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.touch = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceModelCapabilities deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceModelCapabilitiesBuilder();
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

