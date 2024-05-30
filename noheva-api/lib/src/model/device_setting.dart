//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_setting_key.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_setting.g.dart';

/// Read-only setting for a device. This entity is used to deliver device settings to visitor ui devices
///
/// Properties:
/// * [key] 
/// * [value] 
/// * [modifiedAt] 
@BuiltValue()
abstract class DeviceSetting implements Built<DeviceSetting, DeviceSettingBuilder> {
  @BuiltValueField(wireName: r'key')
  DeviceSettingKey get key;
  // enum keyEnum {  SCREEN_DENSITY,  };

  @BuiltValueField(wireName: r'value')
  String get value;

  @BuiltValueField(wireName: r'modifiedAt')
  DateTime get modifiedAt;

  DeviceSetting._();

  factory DeviceSetting([void updates(DeviceSettingBuilder b)]) = _$DeviceSetting;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceSettingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceSetting> get serializer => _$DeviceSettingSerializer();
}

class _$DeviceSettingSerializer implements PrimitiveSerializer<DeviceSetting> {
  @override
  final Iterable<Type> types = const [DeviceSetting, _$DeviceSetting];

  @override
  final String wireName = r'DeviceSetting';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceSetting object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(DeviceSettingKey),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
    yield r'modifiedAt';
    yield serializers.serialize(
      object.modifiedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceSetting object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceSettingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceSettingKey),
          ) as DeviceSettingKey;
          result.key = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        case r'modifiedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.modifiedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceSetting deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceSettingBuilder();
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

