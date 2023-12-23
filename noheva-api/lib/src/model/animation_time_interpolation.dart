//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'animation_time_interpolation.g.dart';

class AnimationTimeInterpolation extends EnumClass {

  @BuiltValueEnumConst(wireName: r'acceleratedecelerate')
  static const AnimationTimeInterpolation acceleratedecelerate = _$acceleratedecelerate;
  @BuiltValueEnumConst(wireName: r'accelerate')
  static const AnimationTimeInterpolation accelerate = _$accelerate;
  @BuiltValueEnumConst(wireName: r'anticipate')
  static const AnimationTimeInterpolation anticipate = _$anticipate;
  @BuiltValueEnumConst(wireName: r'anticipateovershoot')
  static const AnimationTimeInterpolation anticipateovershoot = _$anticipateovershoot;
  @BuiltValueEnumConst(wireName: r'bounce')
  static const AnimationTimeInterpolation bounce = _$bounce;
  @BuiltValueEnumConst(wireName: r'decelerate')
  static const AnimationTimeInterpolation decelerate = _$decelerate;
  @BuiltValueEnumConst(wireName: r'linear')
  static const AnimationTimeInterpolation linear = _$linear;
  @BuiltValueEnumConst(wireName: r'overshoot')
  static const AnimationTimeInterpolation overshoot = _$overshoot;

  static Serializer<AnimationTimeInterpolation> get serializer => _$animationTimeInterpolationSerializer;

  const AnimationTimeInterpolation._(String name): super(name);

  static BuiltSet<AnimationTimeInterpolation> get values => _$values;
  static AnimationTimeInterpolation valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnimationTimeInterpolationMixin = Object with _$AnimationTimeInterpolationMixin;

