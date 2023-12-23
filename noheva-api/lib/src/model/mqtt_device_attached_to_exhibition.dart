//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mqtt_device_attached_to_exhibition.g.dart';

/// MQTT notification message about Device being attached to an Exhibition. This is actually not part of REST API spec but a realtime notification via MQTT channel
///
/// Properties:
/// * [exhibitionId] - Id of Exhibition the ExhibitionDevice belongs to
/// * [deviceId] - Id of Device that was attached to ExhibitionDevice
/// * [exhibitionDeviceId] - Id of ExhibitionDevice that Device belongs to
/// * [exhibitionDeviceGroupId] - Id of ExhibitionDeviceGroup that ExhibitionDevice belongs to
@BuiltValue()
abstract class MqttDeviceAttachedToExhibition implements Built<MqttDeviceAttachedToExhibition, MqttDeviceAttachedToExhibitionBuilder> {
  /// Id of Exhibition the ExhibitionDevice belongs to
  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Id of Device that was attached to ExhibitionDevice
  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  /// Id of ExhibitionDevice that Device belongs to
  @BuiltValueField(wireName: r'exhibitionDeviceId')
  String? get exhibitionDeviceId;

  /// Id of ExhibitionDeviceGroup that ExhibitionDevice belongs to
  @BuiltValueField(wireName: r'exhibitionDeviceGroupId')
  String? get exhibitionDeviceGroupId;

  MqttDeviceAttachedToExhibition._();

  factory MqttDeviceAttachedToExhibition([void updates(MqttDeviceAttachedToExhibitionBuilder b)]) = _$MqttDeviceAttachedToExhibition;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MqttDeviceAttachedToExhibitionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MqttDeviceAttachedToExhibition> get serializer => _$MqttDeviceAttachedToExhibitionSerializer();
}

class _$MqttDeviceAttachedToExhibitionSerializer implements PrimitiveSerializer<MqttDeviceAttachedToExhibition> {
  @override
  final Iterable<Type> types = const [MqttDeviceAttachedToExhibition, _$MqttDeviceAttachedToExhibition];

  @override
  final String wireName = r'MqttDeviceAttachedToExhibition';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MqttDeviceAttachedToExhibition object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.exhibitionId != null) {
      yield r'exhibitionId';
      yield serializers.serialize(
        object.exhibitionId,
        specifiedType: const FullType(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.exhibitionDeviceId != null) {
      yield r'exhibitionDeviceId';
      yield serializers.serialize(
        object.exhibitionDeviceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.exhibitionDeviceGroupId != null) {
      yield r'exhibitionDeviceGroupId';
      yield serializers.serialize(
        object.exhibitionDeviceGroupId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MqttDeviceAttachedToExhibition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MqttDeviceAttachedToExhibitionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'exhibitionDeviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exhibitionDeviceId = valueDes;
          break;
        case r'exhibitionDeviceGroupId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exhibitionDeviceGroupId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MqttDeviceAttachedToExhibition deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MqttDeviceAttachedToExhibitionBuilder();
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

