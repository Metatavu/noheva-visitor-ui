import "dart:io";
import "package:defer_pointer/defer_pointer.dart";
import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/widgets/noheva_widget.dart";

/// Custom Button Widget
///
/// Used by [HtmlWidgets] to build custom button widget from HTML element
class NohevaButton extends NohevaWidget {
  const NohevaButton({
    Key? key,
    required dom.Element element,
    required List<ExhibitionPageEventTrigger> eventTriggers,
    required List<ExhibitionPageTransition> enterTransitions,
    required List<ExhibitionPageTransition> exitTransitions,
    required Map<String, void Function(NohevaWidgetState widget)>
        customOnTapCallbacks,
  }) : super(
          key: key,
          element: element,
          eventTriggers: eventTriggers,
          enterTransitions: enterTransitions,
          exitTransitions: exitTransitions,
          customOnTapCallbacks: customOnTapCallbacks,
        );

  @override
  NohevaButtonState createState() => NohevaButtonState();
}

class NohevaButtonState extends NohevaWidgetState<NohevaButton> {
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

    return Visibility(
      visible: !hidden,
      child: Container(
        constraints: BoxConstraints.loose(size),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: (margin?.vertical ?? 0) / 2,
              child: DeferPointer(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: MaterialStatePropertyAll(backgroundColor),
                    maximumSize: MaterialStatePropertyAll(size),
                    minimumSize: MaterialStatePropertyAll(size),
                    shape: MaterialStatePropertyAll(
                      HtmlWidgets.extractBorderRadius(element),
                    ),
                  ),
                  onPressed: () {
                    customOnTapCallbacks[element.id]?.call(this);
                    tapEvent();
                  },
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
