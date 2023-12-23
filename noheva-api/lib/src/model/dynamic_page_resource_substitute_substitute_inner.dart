//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/dynamic_page_resource_data_source.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dynamic_page_resource_substitute_substitute_inner.g.dart';

/// DynamicPageResourceSubstituteSubstituteInner
///
/// Properties:
/// * [inputKey] 
/// * [dataSource] 
/// * [sourceKey] 
/// * [default_] 
@BuiltValue()
abstract class DynamicPageResourceSubstituteSubstituteInner implements Built<DynamicPageResourceSubstituteSubstituteInner, DynamicPageResourceSubstituteSubstituteInnerBuilder> {
  @BuiltValueField(wireName: r'inputKey')
  String get inputKey;

  @BuiltValueField(wireName: r'dataSource')
  DynamicPageResourceDataSource get dataSource;
  // enum dataSourceEnum {  UserValue,  };

  @BuiltValueField(wireName: r'sourceKey')
  String get sourceKey;

  @BuiltValueField(wireName: r'default')
  String? get default_;

  DynamicPageResourceSubstituteSubstituteInner._();

  factory DynamicPageResourceSubstituteSubstituteInner([void updates(DynamicPageResourceSubstituteSubstituteInnerBuilder b)]) = _$DynamicPageResourceSubstituteSubstituteInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DynamicPageResourceSubstituteSubstituteInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DynamicPageResourceSubstituteSubstituteInner> get serializer => _$DynamicPageResourceSubstituteSubstituteInnerSerializer();
}

class _$DynamicPageResourceSubstituteSubstituteInnerSerializer implements PrimitiveSerializer<DynamicPageResourceSubstituteSubstituteInner> {
  @override
  final Iterable<Type> types = const [DynamicPageResourceSubstituteSubstituteInner, _$DynamicPageResourceSubstituteSubstituteInner];

  @override
  final String wireName = r'DynamicPageResourceSubstituteSubstituteInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DynamicPageResourceSubstituteSubstituteInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'inputKey';
    yield serializers.serialize(
      object.inputKey,
      specifiedType: const FullType(String),
    );
    yield r'dataSource';
    yield serializers.serialize(
      object.dataSource,
      specifiedType: const FullType(DynamicPageResourceDataSource),
    );
    yield r'sourceKey';
    yield serializers.serialize(
      object.sourceKey,
      specifiedType: const FullType(String),
    );
    if (object.default_ != null) {
      yield r'default';
      yield serializers.serialize(
        object.default_,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DynamicPageResourceSubstituteSubstituteInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DynamicPageResourceSubstituteSubstituteInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'inputKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.inputKey = valueDes;
          break;
        case r'dataSource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DynamicPageResourceDataSource),
          ) as DynamicPageResourceDataSource;
          result.dataSource = valueDes;
          break;
        case r'sourceKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceKey = valueDes;
          break;
        case r'default':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.default_ = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DynamicPageResourceSubstituteSubstituteInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DynamicPageResourceSubstituteSubstituteInnerBuilder();
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

