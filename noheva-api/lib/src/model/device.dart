//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_approval_status.dart';
import 'package:noheva_api/src/model/device_type.dart';
import 'package:noheva_api/src/model/device_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device.g.dart';

/// Device object
///
/// Properties:
/// * [id] - ID of Device
/// * [deviceModelId] - Device Model ID
/// * [name] - Name of Device
/// * [serialNumber] - Serial Number of Device
/// * [description] - Description of Device
/// * [approvalStatus] 
/// * [status] 
/// * [deviceType] 
/// * [version] - Version of the application on Device
/// * [warrantyExpiry] - Date when the warranty expires
/// * [usageHours] - Number of hours the Device has been used
/// * [lastConnected] - Last time the Device was connected
/// * [lastSeen] - Last time the device was seen
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class Device implements Built<Device, DeviceBuilder> {
  /// ID of Device
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Device Model ID
  @BuiltValueField(wireName: r'deviceModelId')
  String? get deviceModelId;

  /// Name of Device
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Serial Number of Device
  @BuiltValueField(wireName: r'serialNumber')
  String get serialNumber;

  /// Description of Device
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'approvalStatus')
  DeviceApprovalStatus get approvalStatus;
  // enum approvalStatusEnum {  PENDING,  PENDING_REAPPROVAL,  APPROVED,  READY,  };

  @BuiltValueField(wireName: r'status')
  DeviceStatus get status;
  // enum statusEnum {  ONLINE,  OFFLINE,  };

  @BuiltValueField(wireName: r'deviceType')
  DeviceType get deviceType;
  // enum deviceTypeEnum {  NOHEVA_ANDROID,  NOHEVA_MACOS,  CUSTOM,  };

  /// Version of the application on Device
  @BuiltValueField(wireName: r'version')
  String get version;

  /// Date when the warranty expires
  @BuiltValueField(wireName: r'warrantyExpiry')
  DateTime? get warrantyExpiry;

  /// Number of hours the Device has been used
  @BuiltValueField(wireName: r'usageHours')
  double? get usageHours;

  /// Last time the Device was connected
  @BuiltValueField(wireName: r'lastConnected')
  DateTime? get lastConnected;

  /// Last time the device was seen
  @BuiltValueField(wireName: r'lastSeen')
  DateTime? get lastSeen;

  @BuiltValueField(wireName: r'lastModifierId')
  String? get lastModifierId;

  /// Created date
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  /// Date modified
  @BuiltValueField(wireName: r'modifiedAt')
  DateTime? get modifiedAt;

  Device._();

  factory Device([void updates(DeviceBuilder b)]) = _$Device;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Device> get serializer => _$DeviceSerializer();
}

class _$DeviceSerializer implements PrimitiveSerializer<Device> {
  @override
  final Iterable<Type> types = const [Device, _$Device];

  @override
  final String wireName = r'Device';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Device object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.deviceModelId != null) {
      yield r'deviceModelId';
      yield serializers.serialize(
        object.deviceModelId,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    yield r'serialNumber';
    yield serializers.serialize(
      object.serialNumber,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'approvalStatus';
    yield serializers.serialize(
      object.approvalStatus,
      specifiedType: const FullType(DeviceApprovalStatus),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(DeviceStatus),
    );
    yield r'deviceType';
    yield serializers.serialize(
      object.deviceType,
      specifiedType: const FullType(DeviceType),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    if (object.warrantyExpiry != null) {
      yield r'warrantyExpiry';
      yield serializers.serialize(
        object.warrantyExpiry,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.usageHours != null) {
      yield r'usageHours';
      yield serializers.serialize(
        object.usageHours,
        specifiedType: const FullType(double),
      );
    }
    if (object.lastConnected != null) {
      yield r'lastConnected';
      yield serializers.serialize(
        object.lastConnected,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.lastSeen != null) {
      yield r'lastSeen';
      yield serializers.serialize(
        object.lastSeen,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.lastModifierId != null) {
      yield r'lastModifierId';
      yield serializers.serialize(
        object.lastModifierId,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.modifiedAt != null) {
      yield r'modifiedAt';
      yield serializers.serialize(
        object.modifiedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Device object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceBuilder result,
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
        case r'deviceModelId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceModelId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'serialNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.serialNumber = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'approvalStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceApprovalStatus),
          ) as DeviceApprovalStatus;
          result.approvalStatus = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceStatus),
          ) as DeviceStatus;
          result.status = valueDes;
          break;
        case r'deviceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceType),
          ) as DeviceType;
          result.deviceType = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'warrantyExpiry':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.warrantyExpiry = valueDes;
          break;
        case r'usageHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.usageHours = valueDes;
          break;
        case r'lastConnected':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastConnected = valueDes;
          break;
        case r'lastSeen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastSeen = valueDes;
          break;
        case r'lastModifierId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastModifierId = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'modifiedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.modifiedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Device deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceBuilder();
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

