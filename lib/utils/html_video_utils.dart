import "package:collection/collection.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_visitor_ui/utils/html_widgets.dart";

/// Utilities for parsing Noheva Video components
class HtmlVideoUtils {
  /// Find the first video child element of the given parent element
  static dom.Element? findVideoChild(dom.Element parentElement) =>
      parentElement.children
          .firstWhereOrNull((element) => element.localName == HtmlTags.VIDEO);

  /// Find the video source URI from the given video element
  static String? findVideoSource(dom.Element videoElement) {
    final sourceElement = videoElement.children
        .firstWhereOrNull((element) => element.localName == HtmlTags.SOURCE);
    if (sourceElement == null) return null;

    return HtmlWidgets.extractAttribute(sourceElement,
        attribute: HtmlAttributes.SRC);
  }
}
