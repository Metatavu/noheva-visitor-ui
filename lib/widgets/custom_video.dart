import "dart:io";
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/widgets/video_widget.dart";

/// Custom Video Widget
///
/// Used by [HtmlWidgets] to build custom video widget from HTML element
class CustomVideo extends StatelessWidget {
  final dom.Element element;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;

  const CustomVideo({
    Key? key,
    required this.element,
    required this.resources,
    required this.eventTriggers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = HtmlWidgets.extractSize(element);
    dom.Element? sourceChild = element.children.firstWhereOrNull(
        (element) => element.localName == CustomHtmlWidgets.SOURCE);
    if (sourceChild == null) {
      return Container();
    }
    final source = HtmlWidgets.extractAttribute(sourceChild,
        attribute: CustomHtmlWidgets.SRC);
    if (source == null) {
      return Container();
    }

    return Container(
      width: size.width,
      height: size.height,
      child: VideoWidget(src: source),
    );
  }
}
