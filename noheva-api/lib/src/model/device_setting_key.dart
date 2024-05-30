//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_setting_key.g.dart';

class DeviceSettingKey extends EnumClass {

  /// Device setting key
  @BuiltValueEnumConst(wireName: r'SCREEN_DENSITY')
  static const DeviceSettingKey SCREEN_DENSITY = _$SCREEN_DENSITY;

  static Serializer<DeviceSettingKey> get serializer => _$deviceSettingKeySerializer;

  const DeviceSettingKey._(String name): super(name);

  static BuiltSet<DeviceSettingKey> get values => _$values;
  static DeviceSettingKey valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceSettingKeyMixin = Object with _$DeviceSettingKeyMixin;

