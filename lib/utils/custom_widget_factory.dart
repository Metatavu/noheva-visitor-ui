import "package:collection/collection.dart";
import "package:csslib/visitor.dart" as css;
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/html/html_constants.dart";
import "package:noheva_visitor_ui/html/html_utils.dart";
import "package:noheva_visitor_ui/widgets/noheva_widgets.dart";

/// Custom widget factory for extending support for CSS letter-spacing
class CustomWidgetFactory extends WidgetFactory {
  final BuildContext context;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;
  final List<ExhibitionPageTransition> enterTransitions;
  final List<ExhibitionPageTransition> exitTransitions;
  final String pageId;

  CustomWidgetFactory({
    required this.context,
    required this.resources,
    required this.eventTriggers,
    required this.enterTransitions,
    required this.exitTransitions,
    required this.pageId,
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
    final customTags = [HtmlTags.button, HtmlTags.image, HtmlTags.video];
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
  void _registerNohevaButtonBuildOp(
      BuildTree tree, Future<Future<void> Function()> onTap) {
    final role = HtmlUtils.extractRole(tree.element);

    tree.register(
      BuildOp.v2(
        onRenderBlock: (tree, _) => NohevaButton(
          hidden: role == HtmlAttributeValues.playVideoRole,
          element: tree.element,
          onTap: onTap,
        ),
      ),
    );
  }

  /// Registers custom [BuildOp] for image widgets
  ///
  /// This method also checks if the image is a child of a button element as those cases are handled via the button widget
  void _registerNohevaImageBuildOp(
      BuildTree tree, Future<Future<void> Function()> onTap) {
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
        onRenderBlock: (tree, children) => NohevaVideo(
          element: tree.element,
          children: [children],
        ),
      ),
    );
  }

  /// Registers custom build ops for custom widgets
  void _registerBuildOps(BuildTree tree) {
    final tapEvent = HtmlUtils.handleTapEvent(
      pageId,
      tree.element,
      eventTriggers,
      enterTransitions,
      exitTransitions,
      context,
    );
    final dataComponentType = HtmlUtils.extractAttribute(tree.element,
        attribute: HtmlAttributes.dataComponentType);
    switch (dataComponentType) {
      case HtmlAttributeValues.imageButton:
      case HtmlAttributeValues.button:
        {
          _registerNohevaButtonBuildOp(tree, tapEvent);
        }
      case HtmlAttributeValues.image:
        _registerNohevaImageBuildOp(tree, tapEvent);
      case HtmlTags.video:
        _registerNohevaVideoBuildOp(tree);
    }
  }
}
