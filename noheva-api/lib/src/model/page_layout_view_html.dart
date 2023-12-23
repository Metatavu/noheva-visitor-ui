//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_layout_view_html.g.dart';

/// new version HTML layout data
///
/// Properties:
/// * [html] - HTML content
@BuiltValue()
abstract class PageLayoutViewHtml implements Built<PageLayoutViewHtml, PageLayoutViewHtmlBuilder> {
  /// HTML content
  @BuiltValueField(wireName: r'html')
  String get html;

  PageLayoutViewHtml._();

  factory PageLayoutViewHtml([void updates(PageLayoutViewHtmlBuilder b)]) = _$PageLayoutViewHtml;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageLayoutViewHtmlBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageLayoutViewHtml> get serializer => _$PageLayoutViewHtmlSerializer();
}

class _$PageLayoutViewHtmlSerializer implements PrimitiveSerializer<PageLayoutViewHtml> {
  @override
  final Iterable<Type> types = const [PageLayoutViewHtml, _$PageLayoutViewHtml];

  @override
  final String wireName = r'PageLayoutViewHtml';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageLayoutViewHtml object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'html';
    yield serializers.serialize(
      object.html,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PageLayoutViewHtml object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageLayoutViewHtmlBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'html':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.html = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PageLayoutViewHtml deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageLayoutViewHtmlBuilder();
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

