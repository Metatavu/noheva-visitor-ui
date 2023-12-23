//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/device_model_capabilities.dart';
import 'package:noheva_api/src/model/device_model_display_metrics.dart';
import 'package:noheva_api/src/model/screen_orientation.dart';
import 'package:noheva_api/src/model/device_model_dimensions.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_model.g.dart';

/// Describes device model used in exhibition
///
/// Properties:
/// * [id] 
/// * [manufacturer] 
/// * [model] 
/// * [dimensions] 
/// * [displayMetrics] 
/// * [capabilities] 
/// * [screenOrientation] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class DeviceModel implements Built<DeviceModel, DeviceModelBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'manufacturer')
  String get manufacturer;

  @BuiltValueField(wireName: r'model')
  String get model;

  @BuiltValueField(wireName: r'dimensions')
  DeviceModelDimensions get dimensions;

  @BuiltValueField(wireName: r'displayMetrics')
  DeviceModelDisplayMetrics get displayMetrics;

  @BuiltValueField(wireName: r'capabilities')
  DeviceModelCapabilities get capabilities;

  @BuiltValueField(wireName: r'screenOrientation')
  ScreenOrientation get screenOrientation;
  // enum screenOrientationEnum {  landscape,  portrait,  forcedPortrait,  };

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

  DeviceModel._();

  factory DeviceModel([void updates(DeviceModelBuilder b)]) = _$DeviceModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceModel> get serializer => _$DeviceModelSerializer();
}

class _$DeviceModelSerializer implements PrimitiveSerializer<DeviceModel> {
  @override
  final Iterable<Type> types = const [DeviceModel, _$DeviceModel];

  @override
  final String wireName = r'DeviceModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    yield r'manufacturer';
    yield serializers.serialize(
      object.manufacturer,
      specifiedType: const FullType(String),
    );
    yield r'model';
    yield serializers.serialize(
      object.model,
      specifiedType: const FullType(String),
    );
    yield r'dimensions';
    yield serializers.serialize(
      object.dimensions,
      specifiedType: const FullType(DeviceModelDimensions),
    );
    yield r'displayMetrics';
    yield serializers.serialize(
      object.displayMetrics,
      specifiedType: const FullType(DeviceModelDisplayMetrics),
    );
    yield r'capabilities';
    yield serializers.serialize(
      object.capabilities,
      specifiedType: const FullType(DeviceModelCapabilities),
    );
    yield r'screenOrientation';
    yield serializers.serialize(
      object.screenOrientation,
      specifiedType: const FullType(ScreenOrientation),
    );
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
    DeviceModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceModelBuilder result,
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
        case r'manufacturer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.manufacturer = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.model = valueDes;
          break;
        case r'dimensions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceModelDimensions),
          ) as DeviceModelDimensions;
          result.dimensions.replace(valueDes);
          break;
        case r'displayMetrics':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceModelDisplayMetrics),
          ) as DeviceModelDisplayMetrics;
          result.displayMetrics.replace(valueDes);
          break;
        case r'capabilities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceModelCapabilities),
          ) as DeviceModelCapabilities;
          result.capabilities.replace(valueDes);
          break;
        case r'screenOrientation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScreenOrientation),
          ) as ScreenOrientation;
          result.screenOrientation = valueDes;
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
  DeviceModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceModelBuilder();
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

