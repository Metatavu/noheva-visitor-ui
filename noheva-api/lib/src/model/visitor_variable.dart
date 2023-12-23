//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/visitor_variable_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_variable.g.dart';

/// Metadata for visitor session variable
///
/// Properties:
/// * [id] 
/// * [exhibitionId] 
/// * [name] 
/// * [type] 
/// * [editableFromUI] - Whether the visitor variable should be editable from the customer service UI
/// * [enum_] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class VisitorVariable implements Built<VisitorVariable, VisitorVariableBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'type')
  VisitorVariableType get type;
  // enum typeEnum {  text,  number,  boolean,  enumerated,  };

  /// Whether the visitor variable should be editable from the customer service UI
  @BuiltValueField(wireName: r'editableFromUI')
  bool get editableFromUI;

  @BuiltValueField(wireName: r'enum')
  BuiltList<String>? get enum_;

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

  VisitorVariable._();

  factory VisitorVariable([void updates(VisitorVariableBuilder b)]) = _$VisitorVariable;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorVariableBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisitorVariable> get serializer => _$VisitorVariableSerializer();
}

class _$VisitorVariableSerializer implements PrimitiveSerializer<VisitorVariable> {
  @override
  final Iterable<Type> types = const [VisitorVariable, _$VisitorVariable];

  @override
  final String wireName = r'VisitorVariable';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisitorVariable object, {
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(VisitorVariableType),
    );
    yield r'editableFromUI';
    yield serializers.serialize(
      object.editableFromUI,
      specifiedType: const FullType(bool),
    );
    if (object.enum_ != null) {
      yield r'enum';
      yield serializers.serialize(
        object.enum_,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
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
    VisitorVariable object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorVariableBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VisitorVariableType),
          ) as VisitorVariableType;
          result.type = valueDes;
          break;
        case r'editableFromUI':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.editableFromUI = valueDes;
          break;
        case r'enum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.enum_.replace(valueDes);
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
  VisitorVariable deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorVariableBuilder();
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

