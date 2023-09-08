import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:noheva_api/noheva_api.dart';
import 'package:noheva_visitor_ui/widgets/video_widget.dart';

/// Html Widgets
///
/// This class is used to build custom widgets from HTML elements
class HtmlWidgets {
  /// Builds custom widget from HTML [element]
  ///
  /// Parses elements resource and event trigger data from [resources] and [eventTriggers]
  /// TODO: Implement support for layouts default resources once backend communication is ready.
  static Widget? buildCustomWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
  ) =>
      switch (element.localName) {
        CustomHtmlWidgets.IMAGE =>
          _buildCustomImageWidget(element, resources, eventTriggers),
        CustomHtmlWidgets.BUTTON =>
          _buildCustomButtonWidget(element, resources, eventTriggers),
        CustomHtmlWidgets.VIDEO =>
          _buildCustomVideoWidget(element, resources, eventTriggers),
        _ => null
      };

  /// Builds custom Image widget from HTML [element] and applies [resources]
  ///
  /// TODO: Implement loading images from device memory
  static Widget _buildCustomImageWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? foundEventTrigger =
        _findEventTrigger(element, eventTriggers);
    String? foundResource = resources
        .firstWhereOrNull((resource) => resource.id == element.innerHtml)
        ?.data;

    Widget imageWidget = Image.network(
      foundResource ?? "",
      width: size.width,
      height: size.height,
    );

    if (foundEventTrigger != null) {
      return GestureDetector(
        onTap: _handleTapEvent(foundEventTrigger),
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
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? foundEventTrigger =
        _findEventTrigger(element, eventTriggers);
    String? foundResource = resources
        .firstWhereOrNull((resource) => resource.id == element.innerHtml)
        ?.data;

    return ElevatedButton(
        style: ButtonStyle(fixedSize: MaterialStateProperty.all(size)),
        onPressed: foundEventTrigger != null
            ? _handleTapEvent(foundEventTrigger)
            : null,
        child: Text(foundResource ?? ""));
  }

  /// Builds custom Video widget from HTML [element] and applies [resources]
  static Widget? _buildCustomVideoWidget(
    dom.Element element,
    List<ExhibitionPageResource> resources,
    List<ExhibitionPageEventTrigger> eventTriggers,
  ) {
    Size size = _extractSize(element);
    ExhibitionPageEventTrigger? foundEventTrigger =
        _findEventTrigger(element, eventTriggers);
    String? source = element.children
        .firstWhereOrNull((element) => element.localName == "source")
        ?.attributes[CustomHtmlWidgets.SRC];
    String? foundResource =
        resources.firstWhereOrNull((resource) => resource.id == source)?.data;

    if (source != null) {
      return Container(
        width: size.width,
        height: size.height,
        child: VideoWidget(src: foundResource ?? ""),
      );
    }

    return null;
  }

  /// Finds event trigger assigned to this [element] from [eventTriggers]
  static ExhibitionPageEventTrigger? _findEventTrigger(
    dom.Element element,
    List<ExhibitionPageEventTrigger> eventTriggers,
  ) {
    String? elementId = element.id;
    return eventTriggers.firstWhereOrNull(
        (eventTrigger) => eventTrigger.clickViewId == elementId);
  }

  /// Event handler for tap events on custom widgets per [eventTrigger]
  ///
  /// TODO: Implement this
  static Function() _handleTapEvent(ExhibitionPageEventTrigger eventTrigger) {
    return () {};
  }

  /// Extracts elements width and height
  static Size _extractSize(dom.Element element) {
    final width = double.tryParse(
      _extractAttribute(element, CustomHtmlWidgets.WIDTH) ?? "200",
    );
    final height = double.tryParse(
      _extractAttribute(element, CustomHtmlWidgets.WIDTH) ?? "200",
    );

    return Size(width ?? 200, height ?? 200);
  }

  /// Extracts given [attribute] from HTML [element] and applies [resources]
  static String? _extractAttribute(dom.Element element, String attribute) {
    return element.attributes[attribute];
  }
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