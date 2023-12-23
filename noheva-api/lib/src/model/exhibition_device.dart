//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/screen_orientation.dart';
import 'package:noheva_api/src/model/point.dart';
import 'package:noheva_api/src/model/device_image_load_strategy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_device.g.dart';

/// ExhibitionDevice
///
/// Properties:
/// * [id] 
/// * [exhibitionId] 
/// * [groupId] - Device group id
/// * [deviceId] - Device id
/// * [name] 
/// * [location] 
/// * [screenOrientation] 
/// * [imageLoadStrategy] 
/// * [idlePageId] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class ExhibitionDevice implements Built<ExhibitionDevice, ExhibitionDeviceBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Device group id
  @BuiltValueField(wireName: r'groupId')
  String get groupId;

  /// Device id
  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'location')
  Point? get location;

  @BuiltValueField(wireName: r'screenOrientation')
  ScreenOrientation get screenOrientation;
  // enum screenOrientationEnum {  landscape,  portrait,  forcedPortrait,  };

  @BuiltValueField(wireName: r'imageLoadStrategy')
  DeviceImageLoadStrategy get imageLoadStrategy;
  // enum imageLoadStrategyEnum {  MEMORY,  DISK,  DISK_RAW,  };

  @BuiltValueField(wireName: r'idlePageId')
  String? get idlePageId;

  @BuiltValueField(wireName: r'creatorId')
  String? get creatorId;

  @BuiltValueField(wireName: r'lastModifierId')
  String? get lastModifierId;

  /// Created date
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  /// Date modified
  @BuiltValueField(wireName: r'modifiedAt')
  DateTime? get modifiedAt;

  ExhibitionDevice._();

  factory ExhibitionDevice([void updates(ExhibitionDeviceBuilder b)]) = _$ExhibitionDevice;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExhibitionDeviceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExhibitionDevice> get serializer => _$ExhibitionDeviceSerializer();
}

class _$ExhibitionDeviceSerializer implements PrimitiveSerializer<ExhibitionDevice> {
  @override
  final Iterable<Type> types = const [ExhibitionDevice, _$ExhibitionDevice];

  @override
  final String wireName = r'ExhibitionDevice';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExhibitionDevice object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.exhibitionId != null) {
      yield r'exhibitionId';
      yield serializers.serialize(
        object.exhibitionId,
        specifiedType: const FullType(String),
      );
    }
    yield r'groupId';
    yield serializers.serialize(
      object.groupId,
      specifiedType: const FullType(String),
    );
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType(Point),
      );
    }
    yield r'screenOrientation';
    yield serializers.serialize(
      object.screenOrientation,
      specifiedType: const FullType(ScreenOrientation),
    );
    yield r'imageLoadStrategy';
    yield serializers.serialize(
      object.imageLoadStrategy,
      specifiedType: const FullType(DeviceImageLoadStrategy),
    );
    if (object.idlePageId != null) {
      yield r'idlePageId';
      yield serializers.serialize(
        object.idlePageId,
        specifiedType: const FullType(String),
      );
    }
    if (object.creatorId != null) {
      yield r'creatorId';
      yield serializers.serialize(
        object.creatorId,
        specifiedType: const FullType(String),
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
    ExhibitionDevice object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExhibitionDeviceBuilder result,
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
        case r'groupId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groupId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Point),
          ) as Point;
          result.location.replace(valueDes);
          break;
        case r'screenOrientation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScreenOrientation),
          ) as ScreenOrientation;
          result.screenOrientation = valueDes;
          break;
        case r'imageLoadStrategy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceImageLoadStrategy),
          ) as DeviceImageLoadStrategy;
          result.imageLoadStrategy = valueDes;
          break;
        case r'idlePageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.idlePageId = valueDes;
          break;
        case r'creatorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.creatorId = valueDes;
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
  ExhibitionDevice deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExhibitionDeviceBuilder();
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

