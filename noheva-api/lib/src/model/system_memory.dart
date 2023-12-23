//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'system_memory.g.dart';

/// SystemMemory
///
/// Properties:
/// * [freeMemory] 
/// * [availableProcessors] 
/// * [maxMemory] 
@BuiltValue()
abstract class SystemMemory implements Built<SystemMemory, SystemMemoryBuilder> {
  @BuiltValueField(wireName: r'freeMemory')
  String? get freeMemory;

  @BuiltValueField(wireName: r'availableProcessors')
  String? get availableProcessors;

  @BuiltValueField(wireName: r'maxMemory')
  String? get maxMemory;

  SystemMemory._();

  factory SystemMemory([void updates(SystemMemoryBuilder b)]) = _$SystemMemory;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SystemMemoryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SystemMemory> get serializer => _$SystemMemorySerializer();
}

class _$SystemMemorySerializer implements PrimitiveSerializer<SystemMemory> {
  @override
  final Iterable<Type> types = const [SystemMemory, _$SystemMemory];

  @override
  final String wireName = r'SystemMemory';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SystemMemory object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.freeMemory != null) {
      yield r'freeMemory';
      yield serializers.serialize(
        object.freeMemory,
        specifiedType: const FullType(String),
      );
    }
    if (object.availableProcessors != null) {
      yield r'availableProcessors';
      yield serializers.serialize(
        object.availableProcessors,
        specifiedType: const FullType(String),
      );
    }
    if (object.maxMemory != null) {
      yield r'maxMemory';
      yield serializers.serialize(
        object.maxMemory,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SystemMemory object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SystemMemoryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'freeMemory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.freeMemory = valueDes;
          break;
        case r'availableProcessors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.availableProcessors = valueDes;
          break;
        case r'maxMemory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.maxMemory = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SystemMemory deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SystemMemoryBuilder();
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

