//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/page_layout_view_html.dart';
import 'package:noheva_api/src/model/screen_orientation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_layout.g.dart';

/// Read-only version of layout, that is used to deliver layout data to visitor ui devices.
///
/// Properties:
/// * [id] - Layout id.
/// * [screenOrientation] 
/// * [data] 
/// * [modifiedAt] 
@BuiltValue()
abstract class DeviceLayout implements Built<DeviceLayout, DeviceLayoutBuilder> {
  /// Layout id.
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'screenOrientation')
  ScreenOrientation get screenOrientation;
  // enum screenOrientationEnum {  landscape,  portrait,  forcedPortrait,  };

  @BuiltValueField(wireName: r'data')
  PageLayoutViewHtml get data;

  @BuiltValueField(wireName: r'modifiedAt')
  DateTime get modifiedAt;

  DeviceLayout._();

  factory DeviceLayout([void updates(DeviceLayoutBuilder b)]) = _$DeviceLayout;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceLayoutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceLayout> get serializer => _$DeviceLayoutSerializer();
}

class _$DeviceLayoutSerializer implements PrimitiveSerializer<DeviceLayout> {
  @override
  final Iterable<Type> types = const [DeviceLayout, _$DeviceLayout];

  @override
  final String wireName = r'DeviceLayout';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceLayout object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'screenOrientation';
    yield serializers.serialize(
      object.screenOrientation,
      specifiedType: const FullType(ScreenOrientation),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(PageLayoutViewHtml),
    );
    yield r'modifiedAt';
    yield serializers.serialize(
      object.modifiedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceLayout object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeviceLayoutBuilder result,
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
        case r'screenOrientation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScreenOrientation),
          ) as ScreenOrientation;
          result.screenOrientation = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PageLayoutViewHtml),
          ) as PageLayoutViewHtml;
          result.data.replace(valueDes);
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
  DeviceLayout deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceLayoutBuilder();
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

