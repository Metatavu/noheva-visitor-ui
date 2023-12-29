//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:noheva_api/src/model/page_layout_view_property.dart';
import 'package:built_collection/built_collection.dart';
import 'package:noheva_api/src/model/page_layout_widget_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_layout_view.g.dart';

/// old version Android layout data
///
/// Properties:
/// * [id] 
/// * [widget] 
/// * [properties] 
/// * [children] 
/// * [name] 
/// * [sublayoutId] 
/// * [contentContainerId] 
@BuiltValue()
abstract class PageLayoutView implements Built<PageLayoutView, PageLayoutViewBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'widget')
  PageLayoutWidgetType get widget;
  // enum widgetEnum {  TextView,  FlowTextView,  Button,  TouchableOpacity,  ImageView,  PlayerView,  MediaView,  LinearLayout,  FrameLayout,  RelativeLayout,  MapView,  MaterialTabLayout,  WebView,  VisitorsView,  };

  @BuiltValueField(wireName: r'properties')
  BuiltList<PageLayoutViewProperty> get properties;

  @BuiltValueField(wireName: r'children')
  BuiltList<PageLayoutView> get children;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'sublayoutId')
  String? get sublayoutId;

  @BuiltValueField(wireName: r'contentContainerId')
  String? get contentContainerId;

  PageLayoutView._();

  factory PageLayoutView([void updates(PageLayoutViewBuilder b)]) = _$PageLayoutView;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageLayoutViewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageLayoutView> get serializer => _$PageLayoutViewSerializer();
}

class _$PageLayoutViewSerializer implements PrimitiveSerializer<PageLayoutView> {
  @override
  final Iterable<Type> types = const [PageLayoutView, _$PageLayoutView];

  @override
  final String wireName = r'PageLayoutView';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageLayoutView object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'widget';
    yield serializers.serialize(
      object.widget,
      specifiedType: const FullType(PageLayoutWidgetType),
    );
    yield r'properties';
    yield serializers.serialize(
      object.properties,
      specifiedType: const FullType(BuiltList, [FullType(PageLayoutViewProperty)]),
    );
    yield r'children';
    yield serializers.serialize(
      object.children,
      specifiedType: const FullType(BuiltList, [FullType(PageLayoutView)]),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.sublayoutId != null) {
      yield r'sublayoutId';
      yield serializers.serialize(
        object.sublayoutId,
        specifiedType: const FullType(String),
      );
    }
    if (object.contentContainerId != null) {
      yield r'contentContainerId';
      yield serializers.serialize(
        object.contentContainerId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PageLayoutView object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageLayoutViewBuilder result,
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
        case r'widget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PageLayoutWidgetType),
          ) as PageLayoutWidgetType;
          result.widget = valueDes;
          break;
        case r'properties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PageLayoutViewProperty)]),
          ) as BuiltList<PageLayoutViewProperty>;
          result.properties.replace(valueDes);
          break;
        case r'children':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PageLayoutView)]),
          ) as BuiltList<PageLayoutView>;
          result.children.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'sublayoutId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sublayoutId = valueDes;
          break;
        case r'contentContainerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentContainerId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PageLayoutView deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageLayoutViewBuilder();
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

