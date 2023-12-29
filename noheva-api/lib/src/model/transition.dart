//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/animation_time_interpolation.dart';
import 'package:noheva_api/src/model/animation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transition.g.dart';

/// Transition
///
/// Properties:
/// * [animation] 
/// * [timeInterpolation] 
/// * [duration] 
@BuiltValue()
abstract class Transition implements Built<Transition, TransitionBuilder> {
  @BuiltValueField(wireName: r'animation')
  Animation get animation;
  // enum animationEnum {  fade,  morph,  };

  @BuiltValueField(wireName: r'timeInterpolation')
  AnimationTimeInterpolation get timeInterpolation;
  // enum timeInterpolationEnum {  acceleratedecelerate,  accelerate,  anticipate,  anticipateovershoot,  bounce,  decelerate,  linear,  overshoot,  };

  @BuiltValueField(wireName: r'duration')
  int get duration;

  Transition._();

  factory Transition([void updates(TransitionBuilder b)]) = _$Transition;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TransitionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Transition> get serializer => _$TransitionSerializer();
}

class _$TransitionSerializer implements PrimitiveSerializer<Transition> {
  @override
  final Iterable<Type> types = const [Transition, _$Transition];

  @override
  final String wireName = r'Transition';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Transition object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'animation';
    yield serializers.serialize(
      object.animation,
      specifiedType: const FullType(Animation),
    );
    yield r'timeInterpolation';
    yield serializers.serialize(
      object.timeInterpolation,
      specifiedType: const FullType(AnimationTimeInterpolation),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Transition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TransitionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'animation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Animation),
          ) as Animation;
          result.animation = valueDes;
          break;
        case r'timeInterpolation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnimationTimeInterpolation),
          ) as AnimationTimeInterpolation;
          result.timeInterpolation = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.duration = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Transition deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransitionBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

