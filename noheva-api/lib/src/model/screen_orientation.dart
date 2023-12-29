//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'screen_orientation.g.dart';

class ScreenOrientation extends EnumClass {

  @BuiltValueEnumConst(wireName: r'landscape')
  static const ScreenOrientation landscape = _$landscape;
  @BuiltValueEnumConst(wireName: r'portrait')
  static const ScreenOrientation portrait = _$portrait;
  @BuiltValueEnumConst(wireName: r'forcedPortrait')
  static const ScreenOrientation forcedPortrait = _$forcedPortrait;

  static Serializer<ScreenOrientation> get serializer => _$screenOrientationSerializer;

  const ScreenOrientation._(String name): super(name);

  static BuiltSet<ScreenOrientation> get values => _$values;
  static ScreenOrientation valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ScreenOrientationMixin = Object with _$ScreenOrientationMixin;

