import "package:collection/collection.dart";
import "package:csslib/visitor.dart" as css;
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/widgets/noheva_video.dart";
import "package:noheva_visitor_ui/widgets/noheva_image.dart";
import "package:noheva_visitor_ui/widgets/noheva_button.dart";
import "package:noheva_visitor_ui/widgets/noheva_widget.dart";

/// Custom widget factory for extending support for CSS letter-spacing
class CustomWidgetFactory extends WidgetFactory {
  final BuildContext context;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;
  final List<ExhibitionPageTransition> enterTransitions;
  final List<ExhibitionPageTransition> exitTransitions;
  final Map<String, void Function(NohevaWidgetState widget)> onTapCallbacks;
  final Map<String, void Function(NohevaWidgetState widget)> onBuildCallbacks;

  CustomWidgetFactory({
    required this.context,
    required this.resources,
    required this.eventTriggers,
    required this.enterTransitions,
    required this.exitTransitions,
    this.onBuildCallbacks = const {},
    this.onTapCallbacks = const {},
    bool hidePlayButton = false,
  });

  @override
  void parse(BuildTree tree) {
    _applyLetterSpacing(tree);
    _registerBuildOps(tree);
    super.parse(tree);
  }

  /// Ignore style parsing for custom tags
  ///
  /// Their styles are extracted from the [element] itself during build
  @override
  void parseStyle(BuildTree tree, css.Declaration style) {
    final tagName = tree.element.localName;
    final customTags = [HtmlTags.BUTTON, HtmlTags.IMAGE, HtmlTags.VIDEO];
    if (customTags.contains(tagName)) {
      return;
    }
    super.parseStyle(tree, style);
  }

  /// Applies letter-spacing to the [TextStyle] of the [BuildTree]
  ///
  /// This method extracts the letter-spacing attribute from the HTML element as it is not supported by the core library
  void _applyLetterSpacing(BuildTree tree) {
    final letterSpacingAttribute = tree.element.styles
        .firstWhereOrNull((element) => element.property == "letter-spacing");
    final letterSpacing = double.tryParse(
        letterSpacingAttribute?.value?.toString().replaceAll("px", "") ?? "");
    if (letterSpacing != null) {
      tree.inherit(
        (resolving, _) => resolving.copyWith<void>(
          style: TextStyle(
            letterSpacing: letterSpacing,
          ),
        ),
      );
    }
  }

  /// Registers custom [BuildOp] for button widgets
  void _registerNohevaButtonBuildOp(BuildTree tree, void Function() onTap) {
    tree.register(
      BuildOp.v2(
        onRenderBlock: (tree, _) => NohevaButton(
          hidden: false,
          element: tree.element,
          onTap: onTap,
          onTapCallbacks: onTapCallbacks,
          onBuildCallbacks: onBuildCallbacks,
        ),
      ),
    );
  }

  /// Registers custom [BuildOp] for image widgets
  ///
  /// This method also checks if the image is a child of a button element as those cases are handled via the button widget
  void _registerNohevaImageBuildOp(BuildTree tree, void Function() onTap) {
    if (tree.element.parent?.localName == "button") {
      return;
    }
    tree.register(
      BuildOp.v2(
        onRenderBlock: (tree, _) => NohevaImage(
          hidden: false,
          element: tree.element,
          onTap: onTap,
        ),
      ),
    );
  }

  /// Registers custom [BuildOp] for video widgets
  void _registerNohevaVideoBuildOp(BuildTree tree) {
    tree.register(
      BuildOp.v2(
        onRenderBlock: (tree, _) => NohevaVideo(
          element: tree.element,
          eventTriggers: eventTriggers,
          enterTransitions: enterTransitions,
          exitTransitions: exitTransitions,
        ),
      ),
    );
  }

  /// Registers custom build ops for custom widgets
  void _registerBuildOps(BuildTree tree) {
    final tapEvent = HtmlWidgets.handleTapEvent(tree.element, eventTriggers,
        enterTransitions, exitTransitions, context);
    final dataComponentType = HtmlWidgets.extractAttribute(tree.element,
        attribute: HtmlAttributes.DATA_COMPONENT_TYPE);
    switch (dataComponentType) {
      case HtmlAttributeValues.IMAGE_BUTTON:
      case HtmlAttributeValues.BUTTON:
        {
          _registerNohevaButtonBuildOp(tree, tapEvent);
        }
      case HtmlAttributeValues.IMAGE:
        _registerNohevaImageBuildOp(tree, tapEvent);
      case HtmlTags.VIDEO:
        _registerNohevaVideoBuildOp(tree);
    }
  }
}
