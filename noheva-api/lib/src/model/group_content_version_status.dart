//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_content_version_status.g.dart';

class GroupContentVersionStatus extends EnumClass {

  /// Content version status
  @BuiltValueEnumConst(wireName: r'notstarted')
  static const GroupContentVersionStatus notstarted = _$notstarted;
  /// Content version status
  @BuiltValueEnumConst(wireName: r'inprogress')
  static const GroupContentVersionStatus inprogress = _$inprogress;
  /// Content version status
  @BuiltValueEnumConst(wireName: r'ready')
  static const GroupContentVersionStatus ready = _$ready;

  static Serializer<GroupContentVersionStatus> get serializer => _$groupContentVersionStatusSerializer;

  const GroupContentVersionStatus._(String name): super(name);

  static BuiltSet<GroupContentVersionStatus> get values => _$values;
  static GroupContentVersionStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class GroupContentVersionStatusMixin = Object with _$GroupContentVersionStatusMixin;

