//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_device_status.g.dart';

/// MQTT notification message about devices status. This is actually not part of the REST API spec but a realtime notification via MQTT channel. It is periodically sent by all devices to the server. 
///
/// Properties:
/// * [deviceId] - ID of the device
/// * [status] 
/// * [version] - Current software version running on the device
@BuiltValue()
abstract class MqttDeviceStatus implements Built<MqttDeviceStatus, MqttDeviceStatusBuilder> {
  /// ID of the device
  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  @BuiltValueField(wireName: r'status')
  DeviceStatus get status;
  // enum statusEnum {  ONLINE,  OFFLINE,  };

  /// Current software version running on the device
  @BuiltValueField(wireName: r'version')
  String get version;

  MqttDeviceStatus._();

  factory MqttDeviceStatus([void updates(MqttDeviceStatusBuilder b)]) = _$MqttDeviceStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttDeviceStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttDeviceStatus> get serializer => _$MqttDeviceStatusSerializer();
}

class _$MqttDeviceStatusSerializer implements PrimitiveSerializer<MqttDeviceStatus> {
  @override
  final Iterable<Type> types = const [MqttDeviceStatus, _$MqttDeviceStatus];

  @override
  final String wireName = r'MqttDeviceStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttDeviceStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DeviceStatus),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttDeviceStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttDeviceStatusBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceStatus),
          ) as DeviceStatus;
          result.status = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttDeviceStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttDeviceStatusBuilder();
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

