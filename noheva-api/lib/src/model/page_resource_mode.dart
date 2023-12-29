//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_resource_mode.g.dart';

class PageResourceMode extends EnumClass {

  @BuiltValueEnumConst(wireName: r'static')
  static const PageResourceMode static_ = _$static_;
  @BuiltValueEnumConst(wireName: r'dynamic')
  static const PageResourceMode dynamic_ = _$dynamic_;
  @BuiltValueEnumConst(wireName: r'scripted')
  static const PageResourceMode scripted = _$scripted;

  static Serializer<PageResourceMode> get serializer => _$pageResourceModeSerializer;

  const PageResourceMode._(String name): super(name);

  static BuiltSet<PageResourceMode> get values => _$values;
  static PageResourceMode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PageResourceModeMixin = Object with _$PageResourceModeMixin;

