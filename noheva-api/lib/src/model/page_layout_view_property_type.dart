//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_layout_view_property_type.g.dart';

class PageLayoutViewPropertyType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'string')
  static const PageLayoutViewPropertyType string = _$string;
  @BuiltValueEnumConst(wireName: r'boolean')
  static const PageLayoutViewPropertyType boolean = _$boolean;
  @BuiltValueEnumConst(wireName: r'number')
  static const PageLayoutViewPropertyType number = _$number;
  @BuiltValueEnumConst(wireName: r'color')
  static const PageLayoutViewPropertyType color = _$color;

  static Serializer<PageLayoutViewPropertyType> get serializer => _$pageLayoutViewPropertyTypeSerializer;

  const PageLayoutViewPropertyType._(String name): super(name);

  static BuiltSet<PageLayoutViewPropertyType> get values => _$values;
  static PageLayoutViewPropertyType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PageLayoutViewPropertyTypeMixin = Object with _$PageLayoutViewPropertyTypeMixin;

