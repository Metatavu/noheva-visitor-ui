part of "noheva_widgets.dart";

/// Custom Video Widget
///
/// Used by [HtmlUtils] to build custom video widget from HTML element
class NohevaVideo extends NohevaWidget {
  const NohevaVideo({
    Key? key,
    required List<Widget> children,
    required dom.Element element,
  }) : super(
          key: key,
          element: element,
          children: children,
        );

  @override
  NohevaVideoState createState() => NohevaVideoState();
}

class NohevaVideoState extends NohevaWidgetState<NohevaVideo> {
  NohevaWidgetState? _playButton;
  late VideoPlayerController _videoPlayerController;
  File? _videoThumbnail;
  bool _showVideoThumbnail = true;
  late Size _videoSize;
  bool _looping = false;
  Map<String, void Function(NohevaWidgetState widget)> onTapCallbacks = {};
  Map<String, void Function(NohevaWidgetState widget)> onBuildCallbacks = {};
  late StreamSubscription<PlayVideoEvent> _playVideoStream;

  dom.Element get _parentElement => widget.element;
  dom.Element? get _videoControlsChild =>
      HtmlUtils.findVideoControlsChild(widget.element);

  /// Shows the play button on the video player
  void _showPlayButton() {
    _playButton?.setHidden(_videoPlayerController.value.isPlaying);
  }

  /// Sets the video player controller position to 100ms after initialization and hides the video thumbnail
  ///
  /// [args] is not used but required for correct function signature
  ///
  /// There's a bug with the video player controller where it doesn't show the first frame of the video before played once
  /// and therefore a thumbnail image is displayed on top of it instead.
  void _correctControllerPositionAfterInitialization(dynamic args) {
    _playVideoStream = eventBus.on<PlayVideoEvent>().listen((_) {
      if (context.mounted) _videoPlayerController.play();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      _videoPlayerController.seekTo(const Duration(milliseconds: 100));
      setState(() {
        _showVideoThumbnail = false;
      });
      if (_looping) {
        _videoPlayerController.play();
      }
      eventBus.fire(HidePlayButtonEvent(_looping));
    });
  }

  /// Corrects the video player controller position after the video has been played
  ///
  /// There's a bug with the video player controller where it freezes if the video is set to play from the exact beginning
  void _correctControllerPositionAfterPlay() {
    if (_videoPlayerController.value.position >=
        _videoPlayerController.value.duration) {
      _videoPlayerController.seekTo(const Duration(milliseconds: 100));
      eventBus.fire(HidePlayButtonEvent(_looping));
    }
  }

  /// Parses the required elements from the HTML element
  ///
  /// Video controls are rendered in an overlay on top of the video player
  /// they are represented as elements within an absolute positioned DIV element in the HTML
  void _prepareVideoControlsOverlay() {
    final videoControlsChild = HtmlUtils.findVideoControlsChild(_parentElement);
    if (videoControlsChild == null) {
      SimpleLogger().info("No video controls found in video widget");
      return;
    }
    final playButton = HtmlUtils.findChildByTypeAndRole(videoControlsChild,
        HtmlAttributeValues.imageButton, HtmlAttributeValues.playVideoRole);

    if (playButton == null) {
      SimpleLogger().info("No play button found in video widget");
      return;
    }
    onBuildCallbacks[playButton.id] = (NohevaWidgetState widget) {
      _playButton ??= widget;
      widget.setHidden(true);
    };
    onTapCallbacks[playButton.id] = (NohevaWidgetState widget) {
      _playButton ??= widget;
      widget.toggleHidden();
      _videoPlayerController.play();
    };
  }

  /// Parses the required attributes from the HTML element
  ///
  /// Returns the video source URI if found, otherwise returns null
  String? _prepareVideoElement() {
    _videoSize = HtmlUtils.extractSize(widget.element);
    final videoElement = HtmlUtils.findVideoChild(_parentElement);
    if (videoElement == null) return null;
    _looping = videoElement.attributes.containsKey(HtmlAttributes.loop);

    return HtmlUtils.findVideoSource(videoElement);
  }

  /// Prepares the video player controller for [source] file
  void _prepareVideoPlayerController(String source) {
    _videoPlayerController = VideoPlayerController.file(File(source))
      ..initialize().then(_correctControllerPositionAfterInitialization);
    _videoPlayerController.setLooping(_looping);
    _videoPlayerController.addListener(_showPlayButton);
    _videoPlayerController.addListener(_correctControllerPositionAfterPlay);
  }

  @override
  void initState() {
    super.initState();
    final source = _prepareVideoElement();
    if (source == null) return;
    _prepareVideoControlsOverlay();
    _videoThumbnail = File(source.replaceAll(".mp4", ".thumbnail.jpg"));
    _prepareVideoPlayerController(source);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _playVideoStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoControlsChild == null) {
      SimpleLogger().warning(
          "No video controls found in video widget. Returning an empty container");
      return Container();
    }
    return Indexer(
      children: [
        Indexed(
          index: 2,
          child: Stack(
            children: widget.children,
          ),
        ),
        Indexed(
          index: 1,
          child: SizedBox(
            width: _videoSize.width,
            height: _videoSize.height,
            child: Stack(
              children: [
                _showVideoThumbnail
                    ? Image.file(_videoThumbnail!)
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        Indexed(
          index: 0,
          child: Container(
            width: _videoSize.width,
            height: _videoSize.height,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
