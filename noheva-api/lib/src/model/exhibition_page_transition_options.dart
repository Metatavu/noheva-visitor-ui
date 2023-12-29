//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/exhibition_page_transition_options_morph.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_transition_options.g.dart';

/// ExhibitionPageTransitionOptions
///
/// Properties:
/// * [morph] 
@BuiltValue()
abstract class ExhibitionPageTransitionOptions implements Built<ExhibitionPageTransitionOptions, ExhibitionPageTransitionOptionsBuilder> {
  @BuiltValueField(wireName: r'morph')
  ExhibitionPageTransitionOptionsMorph? get morph;

  ExhibitionPageTransitionOptions._();

  factory ExhibitionPageTransitionOptions([void updates(ExhibitionPageTransitionOptionsBuilder b)]) = _$ExhibitionPageTransitionOptions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageTransitionOptionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageTransitionOptions> get serializer => _$ExhibitionPageTransitionOptionsSerializer();
}

class _$ExhibitionPageTransitionOptionsSerializer implements PrimitiveSerializer<ExhibitionPageTransitionOptions> {
  @override
  final Iterable<Type> types = const [ExhibitionPageTransitionOptions, _$ExhibitionPageTransitionOptions];

  @override
  final String wireName = r'ExhibitionPageTransitionOptions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageTransitionOptions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.morph != null) {
      yield r'morph';
      yield serializers.serialize(
        object.morph,
        specifiedType: const FullType(ExhibitionPageTransitionOptionsMorph),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageTransitionOptions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageTransitionOptionsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'morph':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExhibitionPageTransitionOptionsMorph),
          ) as ExhibitionPageTransitionOptionsMorph;
          result.morph.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageTransitionOptions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageTransitionOptionsBuilder();
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

