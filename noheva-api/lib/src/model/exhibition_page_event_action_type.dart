//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exhibition_page_event_action_type.g.dart';

class ExhibitionPageEventActionType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'hide')
  static const ExhibitionPageEventActionType hide_ = _$hide_;
  @BuiltValueEnumConst(wireName: r'show')
  static const ExhibitionPageEventActionType show_ = _$show_;
  @BuiltValueEnumConst(wireName: r'setuservalue')
  static const ExhibitionPageEventActionType setuservalue = _$setuservalue;
  @BuiltValueEnumConst(wireName: r'navigate')
  static const ExhibitionPageEventActionType navigate = _$navigate;
  @BuiltValueEnumConst(wireName: r'setsrc')
  static const ExhibitionPageEventActionType setsrc = _$setsrc;
  @BuiltValueEnumConst(wireName: r'settext')
  static const ExhibitionPageEventActionType settext = _$settext;
  @BuiltValueEnumConst(wireName: r'triggerdevicegroupevent')
  static const ExhibitionPageEventActionType triggerdevicegroupevent = _$triggerdevicegroupevent;
  @BuiltValueEnumConst(wireName: r'executeWebScript')
  static const ExhibitionPageEventActionType executeWebScript = _$executeWebScript;
  @BuiltValueEnumConst(wireName: r'visitorSessionEnd')
  static const ExhibitionPageEventActionType visitorSessionEnd = _$visitorSessionEnd;
  @BuiltValueEnumConst(wireName: r'startVisitorSession')
  static const ExhibitionPageEventActionType startVisitorSession = _$startVisitorSession;

  static Serializer<ExhibitionPageEventActionType> get serializer => _$exhibitionPageEventActionTypeSerializer;

  const ExhibitionPageEventActionType._(String name): super(name);

  static BuiltSet<ExhibitionPageEventActionType> get values => _$values;
  static ExhibitionPageEventActionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ExhibitionPageEventActionTypeMixin = Object with _$ExhibitionPageEventActionTypeMixin;

