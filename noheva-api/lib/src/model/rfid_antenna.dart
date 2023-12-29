//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/point.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rfid_antenna.g.dart';

/// RfidAntenna
///
/// Properties:
/// * [id] 
/// * [exhibitionId] 
/// * [roomId] - Id of room this RFID antenna is located at
/// * [groupId] - Device group id this antenna is conneted to
/// * [readerId] - RFID reader module id
/// * [antennaNumber] - RFID antenna number
/// * [visitorSessionStartThreshold] - Strength threshold for login events
/// * [visitorSessionEndThreshold] - Strength threshold for logout events
/// * [name] - Human-readable name for this antenna
/// * [location] 
/// * [creatorId] 
/// * [lastModifierId] 
/// * [createdAt] - Created date
/// * [modifiedAt] - Date modified
@BuiltValue()
abstract class RfidAntenna implements Built<RfidAntenna, RfidAntennaBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'exhibitionId')
  String? get exhibitionId;

  /// Id of room this RFID antenna is located at
  @BuiltValueField(wireName: r'roomId')
  String get roomId;

  /// Device group id this antenna is conneted to
  @BuiltValueField(wireName: r'groupId')
  String? get groupId;

  /// RFID reader module id
  @BuiltValueField(wireName: r'readerId')
  String get readerId;

  /// RFID antenna number
  @BuiltValueField(wireName: r'antennaNumber')
  int get antennaNumber;

  /// Strength threshold for login events
  @BuiltValueField(wireName: r'visitorSessionStartThreshold')
  int get visitorSessionStartThreshold;

  /// Strength threshold for logout events
  @BuiltValueField(wireName: r'visitorSessionEndThreshold')
  int get visitorSessionEndThreshold;

  /// Human-readable name for this antenna
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'location')
  Point get location;

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

  RfidAntenna._();

  factory RfidAntenna([void updates(RfidAntennaBuilder b)]) = _$RfidAntenna;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RfidAntennaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RfidAntenna> get serializer => _$RfidAntennaSerializer();
}

class _$RfidAntennaSerializer implements PrimitiveSerializer<RfidAntenna> {
  @override
  final Iterable<Type> types = const [RfidAntenna, _$RfidAntenna];

  @override
  final String wireName = r'RfidAntenna';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RfidAntenna object, {
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
    yield r'roomId';
    yield serializers.serialize(
      object.roomId,
      specifiedType: const FullType(String),
    );
    if (object.groupId != null) {
      yield r'groupId';
      yield serializers.serialize(
        object.groupId,
        specifiedType: const FullType(String),
      );
    }
    yield r'readerId';
    yield serializers.serialize(
      object.readerId,
      specifiedType: const FullType(String),
    );
    yield r'antennaNumber';
    yield serializers.serialize(
      object.antennaNumber,
      specifiedType: const FullType(int),
    );
    yield r'visitorSessionStartThreshold';
    yield serializers.serialize(
      object.visitorSessionStartThreshold,
      specifiedType: const FullType(int),
    );
    yield r'visitorSessionEndThreshold';
    yield serializers.serialize(
      object.visitorSessionEndThreshold,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(Point),
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
    RfidAntenna object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RfidAntennaBuilder result,
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
        case r'roomId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        case r'groupId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.groupId = valueDes;
          break;
        case r'readerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.readerId = valueDes;
          break;
        case r'antennaNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.antennaNumber = valueDes;
          break;
        case r'visitorSessionStartThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.visitorSessionStartThreshold = valueDes;
          break;
        case r'visitorSessionEndThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.visitorSessionEndThreshold = valueDes;
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
  RfidAntenna deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RfidAntennaBuilder();
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

