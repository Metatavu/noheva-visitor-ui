//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_session_variable.g.dart';

/// VisitorSessionVariable
///
/// Properties:
/// * [name] 
/// * [value] 
@BuiltValue()
abstract class VisitorSessionVariable implements Built<VisitorSessionVariable, VisitorSessionVariableBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'value')
  String? get value;

  VisitorSessionVariable._();

  factory VisitorSessionVariable([void updates(VisitorSessionVariableBuilder b)]) = _$VisitorSessionVariable;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorSessionVariableBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisitorSessionVariable> get serializer => _$VisitorSessionVariableSerializer();
}

class _$VisitorSessionVariableSerializer implements PrimitiveSerializer<VisitorSessionVariable> {
  @override
  final Iterable<Type> types = const [VisitorSessionVariable, _$VisitorSessionVariable];

  @override
  final String wireName = r'VisitorSessionVariable';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisitorSessionVariable object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VisitorSessionVariable object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorSessionVariableBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VisitorSessionVariable deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorSessionVariableBuilder();
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

