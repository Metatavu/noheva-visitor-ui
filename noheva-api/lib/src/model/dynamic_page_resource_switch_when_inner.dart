//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource_switch_when_inner.g.dart';

/// DynamicPageResourceSwitchWhenInner
///
/// Properties:
/// * [equals] 
/// * [value] 
/// * [default_] 
@BuiltValue()
abstract class DynamicPageResourceSwitchWhenInner implements Built<DynamicPageResourceSwitchWhenInner, DynamicPageResourceSwitchWhenInnerBuilder> {
  @BuiltValueField(wireName: r'equals')
  String get equals;

  @BuiltValueField(wireName: r'value')
  String get value;

  @BuiltValueField(wireName: r'default')
  bool? get default_;

  DynamicPageResourceSwitchWhenInner._();

  factory DynamicPageResourceSwitchWhenInner([void updates(DynamicPageResourceSwitchWhenInnerBuilder b)]) = _$DynamicPageResourceSwitchWhenInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DynamicPageResourceSwitchWhenInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DynamicPageResourceSwitchWhenInner> get serializer => _$DynamicPageResourceSwitchWhenInnerSerializer();
}

class _$DynamicPageResourceSwitchWhenInnerSerializer implements PrimitiveSerializer<DynamicPageResourceSwitchWhenInner> {
  @override
  final Iterable<Type> types = const [DynamicPageResourceSwitchWhenInner, _$DynamicPageResourceSwitchWhenInner];

  @override
  final String wireName = r'DynamicPageResourceSwitchWhenInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DynamicPageResourceSwitchWhenInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'equals';
    yield serializers.serialize(
      object.equals,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
    if (object.default_ != null) {
      yield r'default';
      yield serializers.serialize(
        object.default_,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DynamicPageResourceSwitchWhenInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DynamicPageResourceSwitchWhenInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'equals':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.equals = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        case r'default':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.default_ = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DynamicPageResourceSwitchWhenInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DynamicPageResourceSwitchWhenInnerBuilder();
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

