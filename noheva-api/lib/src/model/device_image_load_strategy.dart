//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_image_load_strategy.g.dart';

class DeviceImageLoadStrategy extends EnumClass {

  /// Defines how device handles image loading.  * MEMORY - Devices loads all images to memory. This is faster but requires more memory * DISK - Device prescales images and serves then from disk. This is not as fast as serving images from memory but it does not require that much memory. * DISK_RAW - Images are served from the disk without any preprocessing. 
  @BuiltValueEnumConst(wireName: r'MEMORY')
  static const DeviceImageLoadStrategy MEMORY = _$MEMORY;
  /// Defines how device handles image loading.  * MEMORY - Devices loads all images to memory. This is faster but requires more memory * DISK - Device prescales images and serves then from disk. This is not as fast as serving images from memory but it does not require that much memory. * DISK_RAW - Images are served from the disk without any preprocessing. 
  @BuiltValueEnumConst(wireName: r'DISK')
  static const DeviceImageLoadStrategy DISK = _$DISK;
  /// Defines how device handles image loading.  * MEMORY - Devices loads all images to memory. This is faster but requires more memory * DISK - Device prescales images and serves then from disk. This is not as fast as serving images from memory but it does not require that much memory. * DISK_RAW - Images are served from the disk without any preprocessing. 
  @BuiltValueEnumConst(wireName: r'DISK_RAW')
  static const DeviceImageLoadStrategy DISK_RAW = _$DISK_RAW;

  static Serializer<DeviceImageLoadStrategy> get serializer => _$deviceImageLoadStrategySerializer;

  const DeviceImageLoadStrategy._(String name): super(name);

  static BuiltSet<DeviceImageLoadStrategy> get values => _$values;
  static DeviceImageLoadStrategy valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceImageLoadStrategyMixin = Object with _$DeviceImageLoadStrategyMixin;

