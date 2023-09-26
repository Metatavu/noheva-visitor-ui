import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";

/// Custom Button Widget
///
/// Used by [HtmlWidgets] to build custom button widget from HTML element
class CustomButton extends StatelessWidget {
  final dom.Element element;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;

  const CustomButton({
    Key? key,
    required this.element,
    required this.resources,
    required this.eventTriggers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontColor =
        HtmlWidgets.extractColor(element) ?? const Color(0x00000000);
    final fontSize = HtmlWidgets.extractFontSize(element) ?? 16;
    final backgroundColor =
        HtmlWidgets.extractColor(element, property: "background-color");
    final size = HtmlWidgets.extractSize(element);
    final tapEvent =
        HtmlWidgets.handleTapEvent(element, eventTriggers, context) ?? () {};

    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(fontColor),
        textStyle: MaterialStatePropertyAll(
          TextStyle(fontSize: fontSize),
        ),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        maximumSize: MaterialStatePropertyAll(size),
        minimumSize: MaterialStatePropertyAll(size),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: HtmlWidgets.extractBorderRadius(element),
          ),
        ),
      ),
      onPressed: tapEvent,
      child: Text(element.innerHtml),
    );
  }
}
