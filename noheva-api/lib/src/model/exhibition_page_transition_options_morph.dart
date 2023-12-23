//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/exhibition_page_transition_options_morph_view.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_transition_options_morph.g.dart';

/// ExhibitionPageTransitionOptionsMorph
///
/// Properties:
/// * [views] 
@BuiltValue()
abstract class ExhibitionPageTransitionOptionsMorph implements Built<ExhibitionPageTransitionOptionsMorph, ExhibitionPageTransitionOptionsMorphBuilder> {
  @BuiltValueField(wireName: r'views')
  BuiltList<ExhibitionPageTransitionOptionsMorphView> get views;

  ExhibitionPageTransitionOptionsMorph._();

  factory ExhibitionPageTransitionOptionsMorph([void updates(ExhibitionPageTransitionOptionsMorphBuilder b)]) = _$ExhibitionPageTransitionOptionsMorph;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageTransitionOptionsMorphBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageTransitionOptionsMorph> get serializer => _$ExhibitionPageTransitionOptionsMorphSerializer();
}

class _$ExhibitionPageTransitionOptionsMorphSerializer implements PrimitiveSerializer<ExhibitionPageTransitionOptionsMorph> {
  @override
  final Iterable<Type> types = const [ExhibitionPageTransitionOptionsMorph, _$ExhibitionPageTransitionOptionsMorph];

  @override
  final String wireName = r'ExhibitionPageTransitionOptionsMorph';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageTransitionOptionsMorph object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'views';
    yield serializers.serialize(
      object.views,
      specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransitionOptionsMorphView)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageTransitionOptionsMorph object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageTransitionOptionsMorphBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'views':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ExhibitionPageTransitionOptionsMorphView)]),
          ) as BuiltList<ExhibitionPageTransitionOptionsMorphView>;
          result.views.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageTransitionOptionsMorph deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageTransitionOptionsMorphBuilder();
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

