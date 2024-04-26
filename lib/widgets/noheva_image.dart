part of "noheva_widgets.dart";

/// Custom Image Widget
///
/// Used by [HtmlUtils] to build custom image widget from HTML element
class NohevaImage extends NohevaWidget {
  const NohevaImage({
    Key? key,
    bool? hidden,
    required dom.Element element,
    void Function()? onTap,
  }) : super(
          key: key,
          hidden: hidden,
          element: element,
          onTap: onTap,
        );

  @override
  NohevaImageState createState() => NohevaImageState();
}

class NohevaImageState extends NohevaWidgetState<NohevaImage> {
  @override
  Widget build(BuildContext context) {
    final imageSource =
        HtmlUtils.extractAttribute(element, attribute: "src") ?? "";

    final imageWidget = Image.file(
      File(imageSource),
      width: size.width,
      height: size.height,
      fit: BoxFit.fill,
    );

    if (widget.onTap != null) {
      return GestureDetector(
        onTap: widget.onTap,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
