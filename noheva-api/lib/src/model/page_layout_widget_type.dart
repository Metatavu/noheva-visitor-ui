//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_layout_widget_type.g.dart';

class PageLayoutWidgetType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'TextView')
  static const PageLayoutWidgetType textView = _$textView;
  @BuiltValueEnumConst(wireName: r'FlowTextView')
  static const PageLayoutWidgetType flowTextView = _$flowTextView;
  @BuiltValueEnumConst(wireName: r'Button')
  static const PageLayoutWidgetType button = _$button;
  @BuiltValueEnumConst(wireName: r'TouchableOpacity')
  static const PageLayoutWidgetType touchableOpacity = _$touchableOpacity;
  @BuiltValueEnumConst(wireName: r'ImageView')
  static const PageLayoutWidgetType imageView = _$imageView;
  @BuiltValueEnumConst(wireName: r'PlayerView')
  static const PageLayoutWidgetType playerView = _$playerView;
  @BuiltValueEnumConst(wireName: r'MediaView')
  static const PageLayoutWidgetType mediaView = _$mediaView;
  @BuiltValueEnumConst(wireName: r'LinearLayout')
  static const PageLayoutWidgetType linearLayout = _$linearLayout;
  @BuiltValueEnumConst(wireName: r'FrameLayout')
  static const PageLayoutWidgetType frameLayout = _$frameLayout;
  @BuiltValueEnumConst(wireName: r'RelativeLayout')
  static const PageLayoutWidgetType relativeLayout = _$relativeLayout;
  @BuiltValueEnumConst(wireName: r'MapView')
  static const PageLayoutWidgetType mapView = _$mapView;
  @BuiltValueEnumConst(wireName: r'MaterialTabLayout')
  static const PageLayoutWidgetType materialTabLayout = _$materialTabLayout;
  @BuiltValueEnumConst(wireName: r'WebView')
  static const PageLayoutWidgetType webView = _$webView;
  @BuiltValueEnumConst(wireName: r'VisitorsView')
  static const PageLayoutWidgetType visitorsView = _$visitorsView;

  static Serializer<PageLayoutWidgetType> get serializer => _$pageLayoutWidgetTypeSerializer;

  const PageLayoutWidgetType._(String name): super(name);

  static BuiltSet<PageLayoutWidgetType> get values => _$values;
  static PageLayoutWidgetType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PageLayoutWidgetTypeMixin = Object with _$PageLayoutWidgetTypeMixin;

