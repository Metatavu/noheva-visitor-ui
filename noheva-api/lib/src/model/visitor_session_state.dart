//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_session_state.g.dart';

class VisitorSessionState extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const VisitorSessionState PENDING = _$PENDING;
  @BuiltValueEnumConst(wireName: r'ACTIVE')
  static const VisitorSessionState ACTIVE = _$ACTIVE;
  @BuiltValueEnumConst(wireName: r'COMPLETE')
  static const VisitorSessionState COMPLETE = _$COMPLETE;

  static Serializer<VisitorSessionState> get serializer => _$visitorSessionStateSerializer;

  const VisitorSessionState._(String name): super(name);

  static BuiltSet<VisitorSessionState> get values => _$values;
  static VisitorSessionState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class VisitorSessionStateMixin = Object with _$VisitorSessionStateMixin;

