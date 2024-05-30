//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_settigs.g.dart';

/// DeviceSettigs
///
/// Properties:
/// * [id] 
/// * [exhibitionId] 
/// * [deviceId] 
@BuiltValue()
abstract class DeviceSettigs implements Built<DeviceSettigs, DeviceSettigsBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'exhibitionId')
  String get exhibitionId;

  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  DeviceSettigs._();

  factory DeviceSettigs([void updates(DeviceSettigsBuilder b)]) = _$DeviceSettigs;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceSettigsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceSettigs> get serializer => _$DeviceSettigsSerializer();
}

class _$DeviceSettigsSerializer implements PrimitiveSerializer<DeviceSettigs> {
  @override
  final Iterable<Type> types = const [DeviceSettigs, _$DeviceSettigs];

  @override
  final String wireName = r'DeviceSettigs';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceSettigs object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    yield r'exhibitionId';
    yield serializers.serialize(
      object.exhibitionId,
      specifiedType: const FullType(String),
    );
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceSettigs object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceSettigsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'exhibitionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exhibitionId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceSettigs deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceSettigsBuilder();
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

