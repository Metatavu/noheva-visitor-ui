//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_approval_status.g.dart';

class DeviceApprovalStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const DeviceApprovalStatus PENDING = _$PENDING;
  @BuiltValueEnumConst(wireName: r'PENDING_REAPPROVAL')
  static const DeviceApprovalStatus PENDING_REAPPROVAL = _$PENDING_REAPPROVAL;
  @BuiltValueEnumConst(wireName: r'APPROVED')
  static const DeviceApprovalStatus APPROVED = _$APPROVED;
  @BuiltValueEnumConst(wireName: r'READY')
  static const DeviceApprovalStatus READY = _$READY;

  static Serializer<DeviceApprovalStatus> get serializer => _$deviceApprovalStatusSerializer;

  const DeviceApprovalStatus._(String name): super(name);

  static BuiltSet<DeviceApprovalStatus> get values => _$values;
  static DeviceApprovalStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DeviceApprovalStatusMixin = Object with _$DeviceApprovalStatusMixin;

