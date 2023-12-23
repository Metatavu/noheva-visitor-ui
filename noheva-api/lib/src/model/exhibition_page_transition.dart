//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/transition.dart';
import 'package:noheva_api/src/model/exhibition_page_transition_options.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_transition.g.dart';

/// ExhibitionPageTransition
///
/// Properties:
/// * [transition] 
/// * [sourceLayoutId] 
/// * [targetLayoutId] 
/// * [options] 
@BuiltValue()
abstract class ExhibitionPageTransition implements Built<ExhibitionPageTransition, ExhibitionPageTransitionBuilder> {
  @BuiltValueField(wireName: r'transition')
  Transition get transition;

  @BuiltValueField(wireName: r'sourceLayoutId')
  String? get sourceLayoutId;

  @BuiltValueField(wireName: r'targetLayoutId')
  String? get targetLayoutId;

  @BuiltValueField(wireName: r'options')
  ExhibitionPageTransitionOptions? get options;

  ExhibitionPageTransition._();

  factory ExhibitionPageTransition([void updates(ExhibitionPageTransitionBuilder b)]) = _$ExhibitionPageTransition;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageTransitionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageTransition> get serializer => _$ExhibitionPageTransitionSerializer();
}

class _$ExhibitionPageTransitionSerializer implements PrimitiveSerializer<ExhibitionPageTransition> {
  @override
  final Iterable<Type> types = const [ExhibitionPageTransition, _$ExhibitionPageTransition];

  @override
  final String wireName = r'ExhibitionPageTransition';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageTransition object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'transition';
    yield serializers.serialize(
      object.transition,
      specifiedType: const FullType(Transition),
    );
    if (object.sourceLayoutId != null) {
      yield r'sourceLayoutId';
      yield serializers.serialize(
        object.sourceLayoutId,
        specifiedType: const FullType(String),
      );
    }
    if (object.targetLayoutId != null) {
      yield r'targetLayoutId';
      yield serializers.serialize(
        object.targetLayoutId,
        specifiedType: const FullType(String),
      );
    }
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType(ExhibitionPageTransitionOptions),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageTransition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageTransitionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Transition),
          ) as Transition;
          result.transition.replace(valueDes);
          break;
        case r'sourceLayoutId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceLayoutId = valueDes;
          break;
        case r'targetLayoutId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.targetLayoutId = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExhibitionPageTransitionOptions),
          ) as ExhibitionPageTransitionOptions;
          result.options.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageTransition deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageTransitionBuilder();
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

