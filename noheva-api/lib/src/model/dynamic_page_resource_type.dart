//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource_type.g.dart';

class DynamicPageResourceType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'switch')
  static const DynamicPageResourceType switch_ = _$switch_;
  @BuiltValueEnumConst(wireName: r'substitute')
  static const DynamicPageResourceType substitute = _$substitute;

  static Serializer<DynamicPageResourceType> get serializer => _$dynamicPageResourceTypeSerializer;

  const DynamicPageResourceType._(String name): super(name);

  static BuiltSet<DynamicPageResourceType> get values => _$values;
  static DynamicPageResourceType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DynamicPageResourceTypeMixin = Object with _$DynamicPageResourceTypeMixin;

