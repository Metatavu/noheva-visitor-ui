//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event_transition.g.dart';

class ExhibitionPageEventTransition extends EnumClass {

  @BuiltValueEnumConst(wireName: r'fade')
  static const ExhibitionPageEventTransition fade = _$fade;

  static Serializer<ExhibitionPageEventTransition> get serializer => _$exhibitionPageEventTransitionSerializer;

  const ExhibitionPageEventTransition._(String name): super(name);

  static BuiltSet<ExhibitionPageEventTransition> get values => _$values;
  static ExhibitionPageEventTransition valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ExhibitionPageEventTransitionMixin = Object with _$ExhibitionPageEventTransitionMixin;

