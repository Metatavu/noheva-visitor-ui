//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_resource_type.g.dart';

class ExhibitionPageResourceType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'text')
  static const ExhibitionPageResourceType text = _$text;
  @BuiltValueEnumConst(wireName: r'image')
  static const ExhibitionPageResourceType image = _$image;
  @BuiltValueEnumConst(wireName: r'video')
  static const ExhibitionPageResourceType video = _$video;
  @BuiltValueEnumConst(wireName: r'html')
  static const ExhibitionPageResourceType html = _$html;
  @BuiltValueEnumConst(wireName: r'svg')
  static const ExhibitionPageResourceType svg = _$svg;
  @BuiltValueEnumConst(wireName: r'color')
  static const ExhibitionPageResourceType color = _$color;

  static Serializer<ExhibitionPageResourceType> get serializer => _$exhibitionPageResourceTypeSerializer;

  const ExhibitionPageResourceType._(String name): super(name);

  static BuiltSet<ExhibitionPageResourceType> get values => _$values;
  static ExhibitionPageResourceType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ExhibitionPageResourceTypeMixin = Object with _$ExhibitionPageResourceTypeMixin;

