//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'layout_type.g.dart';

class LayoutType extends EnumClass {

  /// Format of the layout data
  @BuiltValueEnumConst(wireName: r'ANDROID')
  static const LayoutType ANDROID = _$ANDROID;
  /// Format of the layout data
  @BuiltValueEnumConst(wireName: r'HTML')
  static const LayoutType HTML = _$HTML;

  static Serializer<LayoutType> get serializer => _$layoutTypeSerializer;

  const LayoutType._(String name): super(name);

  static BuiltSet<LayoutType> get values => _$values;
  static LayoutType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class LayoutTypeMixin = Object with _$LayoutTypeMixin;

