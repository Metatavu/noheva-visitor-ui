part of "noheva_widgets.dart";

/// Custom Button Widget
///
/// Used by [HtmlUtils] to build custom button widget from HTML element
class NohevaButton extends NohevaWidget {
  const NohevaButton({
    Key? key,
    bool? hidden,
    required dom.Element element,
    Future<void Function()>? onTap,
  }) : super(
          key: key,
          hidden: hidden,
          element: element,
          onTap: onTap,
        );

  @override
  NohevaButtonState createState() => NohevaButtonState();
}

class NohevaButtonState extends NohevaWidgetState<NohevaButton> {
  StreamSubscription<HidePlayButtonEvent>? _hidePlayButtonStream;

  /// Setups the video play button if this button is a video play button
  void _setupVideoPlayButton() {
    if (role != HtmlAttributeValues.playVideoRole) return;
    _hidePlayButtonStream = eventBus.on<HidePlayButtonEvent>().listen((event) {
      if (context.mounted) setHidden(event.hide);
    });
  }

  @override
  void initState() {
    super.initState();
    _setupVideoPlayButton();
  }

  @override
  void dispose() {
    _hidePlayButtonStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? imageButtonSource;
    for (var child in element.children) {
      if (child.localName == "img") {
        imageButtonSource = child.attributes['src'];
      }
    }

    Widget? child;
    if (imageButtonSource != null) {
      child = Image.file(File(imageButtonSource));
    } else {
      child = Text(
        element.innerHtml,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontFamily: fontFamily,
        ),
      );
    }

    return Visibility(
      visible: !hidden,
      child: Container(
        constraints: BoxConstraints.loose(size),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: (margin?.vertical ?? 0) / 2,
              child: DeferPointer(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: MaterialStatePropertyAll(backgroundColor),
                    maximumSize: MaterialStatePropertyAll(size),
                    minimumSize: MaterialStatePropertyAll(size),
                    shape: MaterialStatePropertyAll(
                      HtmlUtils.extractBorderRadius(element),
                    ),
                  ),
                  onPressed: () async {
                    if (role == HtmlAttributeValues.playVideoRole) {
                      eventBus.fire(PlayVideoEvent());
                      setHidden(true);
                    }
                    (await widget.onTap)?.call();
                  },
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
