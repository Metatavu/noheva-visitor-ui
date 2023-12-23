//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_key.g.dart';

/// Device key object
///
/// Properties:
/// * [key] - Device Key
@BuiltValue()
abstract class DeviceKey implements Built<DeviceKey, DeviceKeyBuilder> {
  /// Device Key
  @BuiltValueField(wireName: r'key')
  String get key;

  DeviceKey._();

  factory DeviceKey([void updates(DeviceKeyBuilder b)]) = _$DeviceKey;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceKeyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceKey> get serializer => _$DeviceKeySerializer();
}

class _$DeviceKeySerializer implements PrimitiveSerializer<DeviceKey> {
  @override
  final Iterable<Type> types = const [DeviceKey, _$DeviceKey];

  @override
  final String wireName = r'DeviceKey';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceKey object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceKey object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceKeyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceKey deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceKeyBuilder();
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

