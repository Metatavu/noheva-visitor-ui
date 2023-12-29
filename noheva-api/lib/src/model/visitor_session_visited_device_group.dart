//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_session_visited_device_group.g.dart';

/// VisitorSessionVisitedDeviceGroup
///
/// Properties:
/// * [deviceGroupId] 
/// * [enteredAt] - Time visitor session entered the device group
/// * [exitedAt] - Time visitor session exited the device group
@BuiltValue()
abstract class VisitorSessionVisitedDeviceGroup implements Built<VisitorSessionVisitedDeviceGroup, VisitorSessionVisitedDeviceGroupBuilder> {
  @BuiltValueField(wireName: r'deviceGroupId')
  String get deviceGroupId;

  /// Time visitor session entered the device group
  @BuiltValueField(wireName: r'enteredAt')
  DateTime? get enteredAt;

  /// Time visitor session exited the device group
  @BuiltValueField(wireName: r'exitedAt')
  DateTime? get exitedAt;

  VisitorSessionVisitedDeviceGroup._();

  factory VisitorSessionVisitedDeviceGroup([void updates(VisitorSessionVisitedDeviceGroupBuilder b)]) = _$VisitorSessionVisitedDeviceGroup;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorSessionVisitedDeviceGroupBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisitorSessionVisitedDeviceGroup> get serializer => _$VisitorSessionVisitedDeviceGroupSerializer();
}

class _$VisitorSessionVisitedDeviceGroupSerializer implements PrimitiveSerializer<VisitorSessionVisitedDeviceGroup> {
  @override
  final Iterable<Type> types = const [VisitorSessionVisitedDeviceGroup, _$VisitorSessionVisitedDeviceGroup];

  @override
  final String wireName = r'VisitorSessionVisitedDeviceGroup';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisitorSessionVisitedDeviceGroup object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'deviceGroupId';
    yield serializers.serialize(
      object.deviceGroupId,
      specifiedType: const FullType(String),
    );
    if (object.enteredAt != null) {
      yield r'enteredAt';
      yield serializers.serialize(
        object.enteredAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.exitedAt != null) {
      yield r'exitedAt';
      yield serializers.serialize(
        object.exitedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VisitorSessionVisitedDeviceGroup object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorSessionVisitedDeviceGroupBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceGroupId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceGroupId = valueDes;
          break;
        case r'enteredAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.enteredAt = valueDes;
          break;
        case r'exitedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.exitedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VisitorSessionVisitedDeviceGroup deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorSessionVisitedDeviceGroupBuilder();
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

