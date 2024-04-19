import "dart:io";
import "package:defer_pointer/defer_pointer.dart";
import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";

/// Custom Button Widget
///
/// Used by [HtmlWidgets] to build custom button widget from HTML element
class CustomButton extends StatelessWidget {
  final dom.Element element;
  final List<ExhibitionPageEventTrigger> eventTriggers;
  final List<ExhibitionPageTransition> enterTransitions;
  final List<ExhibitionPageTransition> exitTransitions;

  const CustomButton({
    Key? key,
    required this.element,
    required this.eventTriggers,
    required this.enterTransitions,
    required this.exitTransitions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontColor =
        HtmlWidgets.extractColor(element) ?? const Color(0xff000000);
    final fontSize = HtmlWidgets.extractFontSize(element) ?? 16;
    final backgroundColor =
        HtmlWidgets.extractColor(element, property: "background-color");
    final size = HtmlWidgets.extractSize(element);
    final fontFamily = HtmlWidgets.extractFontFamily(element);
    final margin = HtmlWidgets.extractMargin(element);
    final tapEvent = HtmlWidgets.handleTapEvent(
          element,
          eventTriggers,
          enterTransitions,
          exitTransitions,
          context,
        ) ??
        () {};
    String? imageButtonSource;
    for (var child in element.children) {
      if (child.localName == "img") {
        imageButtonSource = child.attributes['src'];
      }
    }

    Widget? child;
    if (imageButtonSource != null) {
      child = Image.file(File(imageButtonSource));
    } else {
      child = Text(
        element.innerHtml,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontFamily: fontFamily,
        ),
      );
    }

    return Container(
      constraints: BoxConstraints.loose((size)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: (margin?.vertical ?? 0) / 2,
            left: (margin?.horizontal ?? 0) / 2,
            child: DeferPointer(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(backgroundColor),
                  maximumSize: MaterialStatePropertyAll(size),
                  minimumSize: MaterialStatePropertyAll(size),
                  shape: MaterialStatePropertyAll(
                    HtmlWidgets.extractBorderRadius(element),
                  ),
                ),
                onPressed: tapEvent,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
