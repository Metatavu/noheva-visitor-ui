//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_group_visitor_session_start_strategy.g.dart';

class DeviceGroupVisitorSessionStartStrategy extends EnumClass {

  /// Defines how device group visitor sessions start. * When \"othersblock\" is selected, group will not start a  visitor session when session is active on another group. * When \"endothers\" is selected, group will end sessions in other groups and start new in this group 
  @BuiltValueEnumConst(wireName: r'othersblock')
  static const DeviceGroupVisitorSessionStartStrategy othersblock = _$othersblock;
  /// Defines how device group visitor sessions start. * When \"othersblock\" is selected, group will not start a  visitor session when session is active on another group. * When \"endothers\" is selected, group will end sessions in other groups and start new in this group 
  @BuiltValueEnumConst(wireName: r'endothers')
  static const DeviceGroupVisitorSessionStartStrategy endothers = _$endothers;

  static Serializer<DeviceGroupVisitorSessionStartStrategy> get serializer => _$deviceGroupVisitorSessionStartStrategySerializer;

  const DeviceGroupVisitorSessionStartStrategy._(String name): super(name);

  static BuiltSet<DeviceGroupVisitorSessionStartStrategy> get values => _$values;
  static DeviceGroupVisitorSessionStartStrategy valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceGroupVisitorSessionStartStrategyMixin = Object with _$DeviceGroupVisitorSessionStartStrategyMixin;

