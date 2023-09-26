import "dart:io";
import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";

/// Custom Image Widget
///
/// Used by [HtmlWidgets] to build custom image widget from HTML element
class CustomImage extends StatelessWidget {
  final dom.Element element;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;

  const CustomImage({
    Key? key,
    required this.element,
    required this.resources,
    required this.eventTriggers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tapEvent =
        HtmlWidgets.handleTapEvent(element, eventTriggers, context);
    final imageSource =
        HtmlWidgets.extractAttribute(element, attribute: "src") ?? "";
    final size = HtmlWidgets.extractSize(element);
    final imageWidget = Image.file(
      File(imageSource),
      width: size.width,
      height: size.height,
      fit: BoxFit.fill,
    );

    if (tapEvent != null) {
      return GestureDetector(
        onTap: tapEvent,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
