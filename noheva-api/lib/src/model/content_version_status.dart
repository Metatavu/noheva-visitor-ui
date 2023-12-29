//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_version_status.g.dart';

class ContentVersionStatus extends EnumClass {

  /// Content version status
  @BuiltValueEnumConst(wireName: r'notstarted')
  static const ContentVersionStatus notstarted = _$notstarted;
  /// Content version status
  @BuiltValueEnumConst(wireName: r'inprogress')
  static const ContentVersionStatus inprogress = _$inprogress;
  /// Content version status
  @BuiltValueEnumConst(wireName: r'ready')
  static const ContentVersionStatus ready = _$ready;

  static Serializer<ContentVersionStatus> get serializer => _$contentVersionStatusSerializer;

  const ContentVersionStatus._(String name): super(name);

  static BuiltSet<ContentVersionStatus> get values => _$values;
  static ContentVersionStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ContentVersionStatusMixin = Object with _$ContentVersionStatusMixin;

