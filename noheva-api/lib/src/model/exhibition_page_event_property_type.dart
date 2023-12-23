//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event_property_type.g.dart';

class ExhibitionPageEventPropertyType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'string')
  static const ExhibitionPageEventPropertyType string = _$string;
  @BuiltValueEnumConst(wireName: r'boolean')
  static const ExhibitionPageEventPropertyType boolean = _$boolean;
  @BuiltValueEnumConst(wireName: r'number')
  static const ExhibitionPageEventPropertyType number = _$number;
  @BuiltValueEnumConst(wireName: r'color')
  static const ExhibitionPageEventPropertyType color = _$color;

  static Serializer<ExhibitionPageEventPropertyType> get serializer => _$exhibitionPageEventPropertyTypeSerializer;

  const ExhibitionPageEventPropertyType._(String name): super(name);

  static BuiltSet<ExhibitionPageEventPropertyType> get values => _$values;
  static ExhibitionPageEventPropertyType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ExhibitionPageEventPropertyTypeMixin = Object with _$ExhibitionPageEventPropertyTypeMixin;

