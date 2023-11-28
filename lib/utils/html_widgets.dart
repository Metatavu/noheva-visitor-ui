import "dart:io";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/widgets/video_widget.dart";
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
    BuildContext context,
  ) =>
      switch (element.localName) {
        CustomHtmlWidgets.IMAGE => _buildCustomImageWidget(
            element,
            resources,
            eventTriggers,
            context,
          ),
        CustomHtmlWidgets.BUTTON => _buildCustomButtonWidget(
            element,
            resources,
            eventTriggers,
            context,
          ),
        CustomHtmlWidgets.VIDEO => _buildCustomVideoWidget(
            element,
            resources,
            eventTriggers,
            context,
          ),
        _ => null
      };

  /// Builds custom Image widget from HTML [element] and applies [resources]
  static Widget _buildCustomImageWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
    BuildContext context,
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? clickViewEventTrigger =
        _findClickViewEventTrigger(element, eventTriggers);

    Widget imageWidget = Image.file(
      File(element.attributes["src"] ?? ""),
      width: size.width,
      height: size.height,
    );

    if (clickViewEventTrigger != null) {
      return GestureDetector(
        onTap: _handleTapEvent(clickViewEventTrigger, context),
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  /// Builds custom Button widget from HTML [element] and applies [resources]
  static Widget _buildCustomButtonWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
    BuildContext context,
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? clickViewEventTrigger =
        _findClickViewEventTrigger(element, eventTriggers);

    // TODO: Parse styles from HTML
    return MaterialButton(
        height: size.height,
        minWidth: size.width,
        onPressed: clickViewEventTrigger != null
            ? _handleTapEvent(clickViewEventTrigger, context)
            : () {},
        child: Text(element.innerHtml));
  }

  /// Builds custom Video widget from HTML [element] and applies [resources]
  static Widget? _buildCustomVideoWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
    BuildContext context,
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? clickViewEventTrigger =
        _findClickViewEventTrigger(element, eventTriggers);
    String? source = element.children
        .firstWhereOrNull(
            (element) => element.localName == CustomHtmlWidgets.SOURCE)
        ?.attributes[CustomHtmlWidgets.SRC];

    if (source != null) {
      return Container(
        width: size.width,
        height: size.height,
        child: VideoWidget(src: source),
      );
    }

    return null;
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

  /// Event handler for tap events on custom widgets per [eventTrigger]
  static Function() _handleTapEvent(
    ExhibitionPageEventTrigger eventTrigger,
    BuildContext context,
  ) {
    return () {
      SimpleLogger().info("Handling tap event...");
      final event = eventTrigger.events?.first;
      final property = event?.properties.first;
      if (property == null) {
        SimpleLogger().info("No event property found!");
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageScreen(
            pageId: property.value,
          ),
        ),
      );
    };
  }

  /// Extracts elements width and height
  static Size _extractSize(dom.Element element) {
    final width = _extractStyleAttribute(element, CustomHtmlWidgets.WIDTH)
        .replaceAll(RegExp(r'(px|%)\b'), "");
    final height = _extractStyleAttribute(element, CustomHtmlWidgets.HEIGHT)
        .replaceAll(RegExp(r'(px|%)\b'), "");

    return Size(double.tryParse(width) ?? 200, double.tryParse(height) ?? 200);
  }

  /// Extracts given style [attribute] from HTML [element]
  static String _extractStyleAttribute(
    dom.Element element,
    String attribute,
  ) =>
      element.styles
          .firstWhereOrNull((style) => style.property == attribute)
          ?.value
          .toString() ??
      "";
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
