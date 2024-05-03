import "package:collection/collection.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/html/html_constants.dart";
import "package:csslib/visitor.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/custom_widget_factory.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:simple_logger/simple_logger.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart" as pc;

/// Utilities for parsing HTML elements for custom widgets
class HtmlUtils {
  /// Extracts margin from HTML [element] styles and returns it as an [EdgeInsets]
  static EdgeInsets? extractMargin(
    dom.Element element,
  ) {
    final marginAttributes =
        element.styles.where((style) => style.property.startsWith("margin-"));

    return EdgeInsets.only(
      top: _parsePixelValueToDouble(
        marginAttributes
            .firstWhereOrNull((style) => style.property == "margin-top")
            ?.value,
      ),
      right: _parsePixelValueToDouble(
        marginAttributes
            .firstWhereOrNull((style) => style.property == "margin-right")
            ?.value,
      ),
      bottom: _parsePixelValueToDouble(
        marginAttributes
            .firstWhereOrNull((style) => style.property == "margin-bottom")
            ?.value,
      ),
      left: _parsePixelValueToDouble(
        marginAttributes
            .firstWhereOrNull((style) => style.property == "margin-left")
            ?.value,
      ),
    );
  }

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
  static Future<Future<void> Function()> handleTapEvent(
    String pageId,
    dom.Element element,
    List<ExhibitionPageEventTrigger> eventTriggers,
    List<ExhibitionPageTransition> enterTransition,
    List<ExhibitionPageTransition> exitTransition,
    BuildContext context,
  ) async {
    return () async {
      final page = await pageDao.findPage(pageId);
      if (page == null) {
        SimpleLogger().shout("Page $pageId not found!");
        return;
      }
      final layout = await layoutDao.findLayout(page.layoutId);
      if (layout == null) {
        SimpleLogger().shout("Layout ${page.layoutId} not found!");
        return;
      }
      ExhibitionPageEventTrigger? clickViewEventTrigger =
          _findClickViewEventTrigger(element, eventTriggers);
      SimpleLogger().info("Handling tap event...");
      final event = clickViewEventTrigger?.events?.first;
      final property = event?.properties.first;
      if (property == null) {
        SimpleLogger().info("No event property found!");
        return;
      }
      final pageHtml = pc.PageController.substitutePageResources(
          layout.data, page.resources);
      NavigationUtils.navigateTo(
        PageScreen(
          pageId: property.value,
          pageWidget: HtmlWidget(
            pageHtml,
            factoryBuilder: () => CustomWidgetFactory(
              pageId: pageId,
              context: context,
              resources: page.resources,
              eventTriggers: page.eventTriggers,
              enterTransitions: page.enterTransitions,
              exitTransitions: page.exitTransitions,
            ),
            customStylesBuilder: (element) {
              if (element.localName == "div") {
                return {
                  "padding": "0px",
                };
              }
              if (["h1", "h2", "h3", "h4", "h5", "h6"]
                  .contains(element.localName)) {
                return {
                  "margin": "0px",
                  "font-family": "Larken-Medium",
                };
              }
              if (element.localName == "p") {
                return {
                  "margin": "0px",
                  "font-family": "Source-Sans-Pro-Regular",
                };
              }

              return null;
            },
          ),
        ),
        context,
        enterTransition: enterTransition.firstOrNull,
        exitTransition: exitTransition.firstOrNull,
      );
    };
  }

  /// Extracts elements width and height
  static Size extractSize(dom.Element element) {
    if (element.localName == HtmlTags.video) {
      final widthString =
          HtmlUtils.extractAttribute(element, attribute: HtmlAttributes.width);
      final heightString =
          HtmlUtils.extractAttribute(element, attribute: HtmlAttributes.height);
      final width = double.tryParse(widthString ?? "0");
      final height = double.tryParse(heightString ?? "0");

      return Size(width ?? 0, height ?? 0);
    } else {
      final width = _parsePixelValueToDouble(
          _extractStyleAttribute(element, HtmlAttributes.width));
      final height = _parsePixelValueToDouble(
          _extractStyleAttribute(element, HtmlAttributes.height));

      return Size(width, height);
    }
  }

  /// Extracts elements font family
  static String? extractFontFamily(dom.Element element) {
    final fontFamily = _extractStyleAttribute(element, "font-family");
    if (fontFamily is LiteralTerm) {
      return fontFamily.text;
    }
    return null;
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

  /// Extracts the role attribte from HTML [element]
  static String? extractRole(dom.Element element) {
    return element.attributes[HtmlAttributes.dataRole];
  }

  /// Finds child element of [parentElement] with given [type] and [role]
  static dom.Element? findChildByTypeAndRole(
    dom.Element parentElement,
    String type,
    String role,
  ) {
    dom.Element? foundChild;
    for (var child in parentElement.children) {
      final elementDataComponentType =
          child.attributes[HtmlAttributes.dataComponentType];
      final elementRole = child.attributes[HtmlAttributes.dataRole];
      if (elementDataComponentType == type && elementRole == role) {
        foundChild = child;
      } else {
        final foundChildInChildren = findChildByTypeAndRole(child, type, role);
        if (foundChildInChildren != null) {
          foundChild = foundChildInChildren;
        }
      }
    }

    return foundChild;
  }

  /// Find the first video child element of the given parent element
  static dom.Element? findVideoChild(dom.Element parentElement) =>
      parentElement.children
          .firstWhereOrNull((element) => element.localName == HtmlTags.video);

  /// Find the video source URI from the given video element
  static String? findVideoSource(dom.Element videoElement) {
    final sourceElement = videoElement.children
        .firstWhereOrNull((element) => element.localName == HtmlTags.source);
    if (sourceElement == null) return null;

    return HtmlUtils.extractAttribute(sourceElement,
        attribute: HtmlAttributes.src);
  }

  /// Finds the video controls child element of the given parent element
  static dom.Element? findVideoControlsChild(dom.Element parentElement) =>
      parentElement.children.firstWhereOrNull((element) =>
          element.attributes[HtmlAttributes.dataComponentType] ==
          HtmlAttributeValues.videoControls);
}
