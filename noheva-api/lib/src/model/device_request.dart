//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_request.g.dart';

/// Device request object
///
/// Properties:
/// * [name] - Name of Device
/// * [serialNumber] - Serial Number of Device
/// * [deviceType] 
/// * [description] - Description of Device
/// * [version] - Version of the application on Device
@BuiltValue()
abstract class DeviceRequest implements Built<DeviceRequest, DeviceRequestBuilder> {
  /// Name of Device
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Serial Number of Device
  @BuiltValueField(wireName: r'serialNumber')
  String get serialNumber;

  @BuiltValueField(wireName: r'deviceType')
  DeviceType get deviceType;
  // enum deviceTypeEnum {  NOHEVA_ANDROID,  NOHEVA_MACOS,  CUSTOM,  };

  /// Description of Device
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Version of the application on Device
  @BuiltValueField(wireName: r'version')
  String get version;

  DeviceRequest._();

  factory DeviceRequest([void updates(DeviceRequestBuilder b)]) = _$DeviceRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceRequest> get serializer => _$DeviceRequestSerializer();
}

class _$DeviceRequestSerializer implements PrimitiveSerializer<DeviceRequest> {
  @override
  final Iterable<Type> types = const [DeviceRequest, _$DeviceRequest];

  @override
  final String wireName = r'DeviceRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'deviceType';
    yield serializers.serialize(
      object.deviceType,
      specifiedType: const FullType(DeviceType),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceRequestBuilder result,
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
        case r'serialNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.serialNumber = valueDes;
          break;
        case r'deviceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceType),
          ) as DeviceType;
          result.deviceType = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
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
  DeviceRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceRequestBuilder();
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

