import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

/// Custom widget factory for extending support for CSS letter-spacing
class CustomWidgetFactory extends WidgetFactory {
  @override
  void parse(BuildTree tree) {
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
    super.parse(tree);
  }
}
