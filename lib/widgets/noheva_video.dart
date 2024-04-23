import "dart:async";
import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:html/dom.dart" as dom;
import "package:indexed/indexed.dart";
import "package:noheva_visitor_ui/utils/html_video_utils.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/widgets/noheva_widget.dart";
import "package:simple_logger/simple_logger.dart";
import "package:video_player/video_player.dart";

/// Custom Video Widget
///
/// Used by [HtmlWidgets] to build custom video widget from HTML element
class NohevaVideo extends NohevaWidget {
  final dom.Element element;
  final List<WidgetPlaceholder> children;

  const NohevaVideo({
    Key? key,
    required this.children,
    required this.element,
  }) : super(key: key, children: children, element: element);

  @override
  NohevaVideoState createState() => NohevaVideoState();
}

class NohevaVideoState extends NohevaWidgetState<NohevaVideo> {
  NohevaWidgetState? _playButton;
  late VideoPlayerController _videoPlayerController;
  File? _videoThumbnail;
  bool _showVideoThumbnail = true;
  late Size _videoSize;
  bool _autoPlay = false;
  bool _looping = false;
  Map<String, void Function(NohevaWidgetState widget)> onTapCallbacks = {};

  dom.Element get _parentElement => widget.element;
  dom.Element? get _videoControlsChild =>
      HtmlVideoUtils.findVideoControlsChild(widget.element);

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
    Future.delayed(const Duration(milliseconds: 100), () {
      _videoPlayerController.seekTo(const Duration(milliseconds: 100));
      setState(() {
        _showVideoThumbnail = false;
      });
      if (_autoPlay) {
        _videoPlayerController.play();
      }
    });
    setState(() {});
  }

  /// Corrects the video player controller position after the video has been played
  ///
  /// There's a bug with the video player controller where it freezes if the video is set to play from the exact beginning
  void _correctControllerPositionAfterPlay() {
    if (_videoPlayerController.value.position >=
        _videoPlayerController.value.duration) {
      _videoPlayerController.seekTo(const Duration(milliseconds: 100));
    }
  }

  /// Parses the required elements from the HTML element
  ///
  /// Video controls are rendered in an overlay on top of the video player
  /// they are represented as elements within an absolute positioned DIV element in the HTML
  void _prepareVideoControlsOverlay() {
    final videoControlsChild =
        HtmlVideoUtils.findVideoControlsChild(_parentElement);
    if (videoControlsChild == null) {
      SimpleLogger().info("No video controls found in video widget");
      return;
    }
    final playButton = HtmlWidgets.findChildByTypeAndRole(videoControlsChild,
        HtmlAttributeValues.IMAGE_BUTTON, HtmlAttributeValues.PLAY_VIDEO_ROLE);

    if (playButton == null) {
      SimpleLogger().info("No play button found in video widget");
      return;
    }
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
    _videoSize = HtmlWidgets.extractSize(widget.element);
    final videoElement = HtmlVideoUtils.findVideoChild(_parentElement);
    if (videoElement == null) return null;
    _autoPlay = videoElement.attributes.containsKey(HtmlAttributes.AUTOPLAY);
    _looping = videoElement.attributes.containsKey(HtmlAttributes.LOOP);

    return HtmlVideoUtils.findVideoSource(videoElement);
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
          child: Container(
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
