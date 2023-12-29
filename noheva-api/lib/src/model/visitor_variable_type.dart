//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_variable_type.g.dart';

class VisitorVariableType extends EnumClass {

  /// Visitor variable type
  @BuiltValueEnumConst(wireName: r'text')
  static const VisitorVariableType text = _$text;
  /// Visitor variable type
  @BuiltValueEnumConst(wireName: r'number')
  static const VisitorVariableType number = _$number;
  /// Visitor variable type
  @BuiltValueEnumConst(wireName: r'boolean')
  static const VisitorVariableType boolean = _$boolean;
  /// Visitor variable type
  @BuiltValueEnumConst(wireName: r'enumerated')
  static const VisitorVariableType enumerated = _$enumerated;

  static Serializer<VisitorVariableType> get serializer => _$visitorVariableTypeSerializer;

  const VisitorVariableType._(String name): super(name);

  static BuiltSet<VisitorVariableType> get values => _$values;
  static VisitorVariableType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class VisitorVariableTypeMixin = Object with _$VisitorVariableTypeMixin;

