import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_visitor_ui/utils/html_widgets.dart";

abstract class NohevaWidget extends StatefulWidget {
  final bool? hidden;
  final dom.Element element;
  final List<Widget> children;
  final void Function()? onTap;
  final Map<String, void Function(NohevaWidgetState widget)> onTapCallbacks;

  const NohevaWidget({
    Key? key,
    required this.element,
    this.hidden,
    this.onTap,
    this.children = const [],
    this.onTapCallbacks = const {},
  }) : super(key: key);
}

abstract class NohevaWidgetState<T extends NohevaWidget> extends State<T> {
  dom.Element get element => widget.element;
  Map<String, void Function(NohevaWidgetState widget)>
      get customOnTapCallbacks => widget.onTapCallbacks;

  bool hidden = false;

  Color get fontColor =>
      HtmlWidgets.extractColor(element) ?? const Color(0xff000000);
  double get fontSize => HtmlWidgets.extractFontSize(element) ?? 16;
  Color? get backgroundColor =>
      HtmlWidgets.extractColor(element, property: "background-color");
  Size get size => HtmlWidgets.extractSize(element);
  String? get fontFamily => HtmlWidgets.extractFontFamily(element);
  EdgeInsets? get margin => HtmlWidgets.extractMargin(element);
  String? get role => HtmlWidgets.extractRole(element);

  void toggleHidden() {
    setState(() {
      hidden = !hidden;
    });
  }

  void setHidden(bool value) {
    setState(() {
      hidden = value;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.hidden != null) {
      hidden = widget.hidden!;
    }
  }
}
