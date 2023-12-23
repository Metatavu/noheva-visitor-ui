//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/dynamic_page_resource_data_source.dart';
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_switch_when_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource_switch.g.dart';

/// DynamicPageResourceSwitch
///
/// Properties:
/// * [dataSource] 
/// * [key] 
/// * [when] 
@BuiltValue()
abstract class DynamicPageResourceSwitch implements Built<DynamicPageResourceSwitch, DynamicPageResourceSwitchBuilder> {
  @BuiltValueField(wireName: r'dataSource')
  DynamicPageResourceDataSource get dataSource;
  // enum dataSourceEnum {  UserValue,  };

  @BuiltValueField(wireName: r'key')
  String? get key;

  @BuiltValueField(wireName: r'when')
  BuiltList<DynamicPageResourceSwitchWhenInner>? get when;

  DynamicPageResourceSwitch._();

  factory DynamicPageResourceSwitch([void updates(DynamicPageResourceSwitchBuilder b)]) = _$DynamicPageResourceSwitch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DynamicPageResourceSwitchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DynamicPageResourceSwitch> get serializer => _$DynamicPageResourceSwitchSerializer();
}

class _$DynamicPageResourceSwitchSerializer implements PrimitiveSerializer<DynamicPageResourceSwitch> {
  @override
  final Iterable<Type> types = const [DynamicPageResourceSwitch, _$DynamicPageResourceSwitch];

  @override
  final String wireName = r'DynamicPageResourceSwitch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DynamicPageResourceSwitch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'dataSource';
    yield serializers.serialize(
      object.dataSource,
      specifiedType: const FullType(DynamicPageResourceDataSource),
    );
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType(String),
      );
    }
    if (object.when != null) {
      yield r'when';
      yield serializers.serialize(
        object.when,
        specifiedType: const FullType(BuiltList, [FullType(DynamicPageResourceSwitchWhenInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DynamicPageResourceSwitch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DynamicPageResourceSwitchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'dataSource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DynamicPageResourceDataSource),
          ) as DynamicPageResourceDataSource;
          result.dataSource = valueDes;
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'when':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DynamicPageResourceSwitchWhenInner)]),
          ) as BuiltList<DynamicPageResourceSwitchWhenInner>;
          result.when.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DynamicPageResourceSwitch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DynamicPageResourceSwitchBuilder();
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

