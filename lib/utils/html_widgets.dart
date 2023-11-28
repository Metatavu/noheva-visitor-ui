import "package:collection/collection.dart";
import "package:csslib/visitor.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:noheva_visitor_ui/widgets/custom_button.dart";
import "package:noheva_visitor_ui/widgets/custom_image.dart";
import "package:noheva_visitor_ui/widgets/custom_video.dart";
import "package:simple_logger/simple_logger.dart";

/// Html Widgets
///
/// This class is used to build custom widgets from HTML elements
class HtmlWidgets {
  /// Builds custom widget from HTML [element]
  ///
  /// Parses elements resource and event trigger data from [resources] and [eventTriggers]
  static Widget? buildCustomWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
    List<ExhibitionPageTransition> enterTransitions,
    List<ExhibitionPageTransition> exitTransitions,
    BuildContext context,
  ) =>
      switch (element.localName) {
        CustomHtmlWidgets.IMAGE => CustomImage(
            element: element,
            resources: resources,
            eventTriggers: eventTriggers,
            enterTransitions: enterTransitions,
            exitTransitions: exitTransitions,
          ),
        CustomHtmlWidgets.BUTTON => CustomButton(
            element: element,
            resources: resources,
            eventTriggers: eventTriggers,
            enterTransitions: enterTransitions,
            exitTransitions: exitTransitions,
          ),
        CustomHtmlWidgets.VIDEO => CustomVideo(
            element: element,
            resources: resources,
            eventTriggers: eventTriggers,
          ),
        _ => null
      };

  /// Extracts color from HTML [element] styles and returns it as an int
  static Color? extractColor(
    dom.Element element, {
    String property = "color",
  }) {
    final colorAttribute =
        element.styles.where((style) => style.property == property).firstOrNull;
    if (colorAttribute == null) {
      return null;
    }
    final color = colorAttribute.value;
    if (color == null) {
      return null;
    }
    switch (color.runtimeType) {
      case FunctionTerm:
        {
          final params = (colorAttribute.value as FunctionTerm).params;
          final r = _parseColorRgbElement(params[0]);
          final g = _parseColorRgbElement(params[1]);
          final b = _parseColorRgbElement(params[2]);
          final a = params.length >= 4 ? _parseColorAlpha(params[3]) : 255;
          if (r != null && g != null && b != null && a != null) {
            return Color.fromARGB(a, r, g, b);
          }
        }
      case HexColorTerm:
        {
          final hexColor = (colorAttribute.value as HexColorTerm).text;
          return Color(int.parse(hexColor, radix: 16)).withAlpha(255);
        }
    }

    return null;
  }

  static String? extractAttribute(
    dom.Element element, {
    required String attribute,
  }) {
    return element.attributes[attribute];
  }

  static OutlinedBorder extractBorderRadius(dom.Element element) {
    final size = extractSize(element);
    final borderRadiusAttribute = element.styles
        .firstWhereOrNull((style) => style.property == "border-radius")
        ?.values;
    if (borderRadiusAttribute == null) {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      );
    }

    final parsedValues = borderRadiusAttribute
        .map((value) => _parsePixelValueToDouble(value))
        .toList();
    if (parsedValues.every((element) => element == parsedValues[0]) &&
        parsedValues.isNotEmpty &&
        parsedValues[0] == size.width &&
        parsedValues[0] == size.height) {
      return const CircleBorder();
    }
    return RoundedRectangleBorder(
        borderRadius: switch (borderRadiusAttribute.length) {
      1 => BorderRadius.all(
          Radius.circular(
            parsedValues[0],
          ),
        ),
      2 => BorderRadius.only(
          topLeft: Radius.circular(parsedValues[0]),
          bottomRight: Radius.circular(parsedValues[0]),
          topRight: Radius.circular(parsedValues[1]),
          bottomLeft: Radius.circular(parsedValues[1]),
        ),
      3 => BorderRadius.only(
          topLeft: Radius.circular(parsedValues[0]),
          topRight: Radius.circular(parsedValues[1]),
          bottomLeft: Radius.circular(parsedValues[1]),
          bottomRight: Radius.circular(parsedValues[2])),
      4 => BorderRadius.only(
          topLeft: Radius.circular(parsedValues[0]),
          topRight: Radius.circular(parsedValues[1]),
          bottomRight: Radius.circular(parsedValues[2]),
          bottomLeft: Radius.circular(parsedValues[3]),
        ),
      _ => const BorderRadius.only()
    });
  }

  static double? extractFontSize(dom.Element element) {
    final fontSize = _extractStyleAttribute(element, "font-size");

    return _parsePixelValueToDouble(fontSize);
  }

  /// Event handler for tap events on custom widgets per [eventTrigger]
  static Function()? handleTapEvent(
    dom.Element element,
    List<ExhibitionPageEventTrigger> eventTriggers,
    List<ExhibitionPageTransition> enterTransition,
    List<ExhibitionPageTransition> exitTransition,
    BuildContext context,
  ) {
    return () {
      ExhibitionPageEventTrigger? clickViewEventTrigger =
          _findClickViewEventTrigger(element, eventTriggers);
      SimpleLogger().info("Handling tap event...");
      final event = clickViewEventTrigger?.events?.first;
      final property = event?.properties.first;
      if (property == null) {
        SimpleLogger().info("No event property found!");
        return null;
      }
      NavigationUtils.navigateTo(
        PageScreen(pageId: property.value),
        context,
        enterTransition: enterTransition.firstOrNull,
        exitTransition: exitTransition.firstOrNull,
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PageScreen(
      //       pageId: property.value,
      //     ),
      //   ),
      // );
    };
  }

  /// Extracts elements width and height
  static Size extractSize(dom.Element element) {
    if (element.localName == CustomHtmlWidgets.VIDEO) {
      final widthString = HtmlWidgets.extractAttribute(element,
          attribute: CustomHtmlWidgets.WIDTH);
      final heightString = HtmlWidgets.extractAttribute(element,
          attribute: CustomHtmlWidgets.HEIGHT);
      final width = double.tryParse(widthString ?? "0");
      final height = double.tryParse(heightString ?? "0");

      return Size(width ?? 0, height ?? 0);
    } else {
      final width = _parsePixelValueToDouble(
          _extractStyleAttribute(element, CustomHtmlWidgets.WIDTH));
      final height = _parsePixelValueToDouble(
          _extractStyleAttribute(element, CustomHtmlWidgets.HEIGHT));

      return Size(width, height);
    }
  }

  /// Parses RGB color element from [Expression]
  static int? _parseColorRgbElement(Expression v) => (v is NumberTerm
          ? v.number.ceil()
          : v is PercentageTerm
              ? (v.valueAsDouble * 255.0).ceil()
              : null)
      ?.clamp(0, 255);

  /// Parses Alpha color element from [Expression]
  static int? _parseColorAlpha(Expression v) => (v is NumberTerm
          ? (v.number * 255).ceil()
          : v is PercentageTerm
              ? (v.valueAsDouble * 255.0).ceil()
              : 255)
      .clamp(0, 255);

  static double _parsePixelValueToDouble(Expression? value) {
    return double.tryParse(value.toString().replaceAll("px", "")) ?? 0;
  }

  /// Finds event trigger assigned to this [element] from [eventTriggers]
  static ExhibitionPageEventTrigger? _findClickViewEventTrigger(
    dom.Element element,
    List<ExhibitionPageEventTrigger> eventTriggers,
  ) {
    String? elementId = element.id;
    return eventTriggers.firstWhereOrNull(
        (eventTrigger) => eventTrigger.clickViewId == elementId);
  }

  /// Extracts given style [attribute] from HTML [element]
  static Expression? _extractStyleAttribute(
    dom.Element element,
    String attribute,
  ) =>
      element.styles
          .firstWhereOrNull((style) => style.property == attribute)
          ?.value;
}

class CustomHtmlWidgets {
  static const String IMAGE = "img";
  static const String BUTTON = "button";
  static const String VIDEO = "video";
  static const String SOURCE = "source";

  static const String WIDTH = "width";
  static const String HEIGHT = "height";
  static const String SRC = "src";
}
