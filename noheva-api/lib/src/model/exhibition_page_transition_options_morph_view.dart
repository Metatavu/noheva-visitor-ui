//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_transition_options_morph_view.g.dart';

/// ExhibitionPageTransitionOptionsMorphView
///
/// Properties:
/// * [sourceId] 
/// * [targetId] 
@BuiltValue()
abstract class ExhibitionPageTransitionOptionsMorphView implements Built<ExhibitionPageTransitionOptionsMorphView, ExhibitionPageTransitionOptionsMorphViewBuilder> {
  @BuiltValueField(wireName: r'sourceId')
  String get sourceId;

  @BuiltValueField(wireName: r'targetId')
  String get targetId;

  ExhibitionPageTransitionOptionsMorphView._();

  factory ExhibitionPageTransitionOptionsMorphView([void updates(ExhibitionPageTransitionOptionsMorphViewBuilder b)]) = _$ExhibitionPageTransitionOptionsMorphView;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionPageTransitionOptionsMorphViewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionPageTransitionOptionsMorphView> get serializer => _$ExhibitionPageTransitionOptionsMorphViewSerializer();
}

class _$ExhibitionPageTransitionOptionsMorphViewSerializer implements PrimitiveSerializer<ExhibitionPageTransitionOptionsMorphView> {
  @override
  final Iterable<Type> types = const [ExhibitionPageTransitionOptionsMorphView, _$ExhibitionPageTransitionOptionsMorphView];

  @override
  final String wireName = r'ExhibitionPageTransitionOptionsMorphView';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionPageTransitionOptionsMorphView object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'sourceId';
    yield serializers.serialize(
      object.sourceId,
      specifiedType: const FullType(String),
    );
    yield r'targetId';
    yield serializers.serialize(
      object.targetId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ExhibitionPageTransitionOptionsMorphView object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionPageTransitionOptionsMorphViewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceId = valueDes;
          break;
        case r'targetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.targetId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExhibitionPageTransitionOptionsMorphView deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionPageTransitionOptionsMorphViewBuilder();
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

