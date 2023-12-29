//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_type.g.dart';

class DeviceType extends EnumClass {

  /// Device type object
  @BuiltValueEnumConst(wireName: r'NOHEVA_ANDROID')
  static const DeviceType NOHEVA_ANDROID = _$NOHEVA_ANDROID;
  /// Device type object
  @BuiltValueEnumConst(wireName: r'NOHEVA_MACOS')
  static const DeviceType NOHEVA_MACOS = _$NOHEVA_MACOS;
  /// Device type object
  @BuiltValueEnumConst(wireName: r'CUSTOM')
  static const DeviceType CUSTOM = _$CUSTOM;

  static Serializer<DeviceType> get serializer => _$deviceTypeSerializer;

  const DeviceType._(String name): super(name);

  static BuiltSet<DeviceType> get values => _$values;
  static DeviceType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceTypeMixin = Object with _$DeviceTypeMixin;

