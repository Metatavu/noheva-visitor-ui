part of "noheva_widgets.dart";

/// Abstract Noheva Widget
///
/// All custom widgets (Widgets not parsed and built by [HtmlWidget]) should extend this class
/// e.g. [NohevaButton], [NohevaImage], [NohevaVideo]
abstract class NohevaWidget extends StatefulWidget {
  final bool? hidden;
  final dom.Element element;
  final List<Widget> children;
  final void Function()? onTap;

  const NohevaWidget({
    Key? key,
    required this.element,
    this.hidden,
    this.onTap,
    this.children = const [],
  }) : super(key: key);
}

abstract class NohevaWidgetState<T extends NohevaWidget> extends State<T> {
  bool hidden = false;

  dom.Element get element => widget.element;
  double get fontSize => HtmlUtils.extractFontSize(element) ?? 16;
  Size get size => HtmlUtils.extractSize(element);
  String? get fontFamily => HtmlUtils.extractFontFamily(element);
  EdgeInsets? get margin => HtmlUtils.extractMargin(element);
  String? get role => HtmlUtils.extractRole(element);
  Color get fontColor =>
      HtmlUtils.extractColor(element) ?? const Color(0xff000000);
  Color? get backgroundColor =>
      HtmlUtils.extractColor(element, property: "background-color");

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
