import "dart:async";
import "dart:io";
import "package:collection/collection.dart";
import "package:defer_pointer/defer_pointer.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:html/dom.dart" as dom;
import "package:indexed/indexed.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_video_utils.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:noheva_visitor_ui/widgets/noheva_widget.dart";
import "package:simple_logger/simple_logger.dart";
import "package:video_player/video_player.dart";

/// Custom Video Widget
///
/// Used by [HtmlWidgets] to build custom video widget from HTML element
class CustomVideo extends StatefulWidget {
  final dom.Element element;
  final List<ExhibitionPageResource> resources;
  final List<ExhibitionPageEventTrigger> eventTriggers;

  const CustomVideo({
    Key? key,
    required this.element,
    required this.resources,
    required this.eventTriggers,
  }) : super(key: key);

  @override
  State<CustomVideo> createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  NohevaWidgetState? _playButton;
  late VideoPlayerController _videoPlayerController;
  File? _videoThumbnail;
  bool _showVideoThumbnail = true;
  late Size _videoSize;

  dom.Element get parentElement => widget.element;

  @override
  void initState() {
    super.initState();
    _videoSize = HtmlWidgets.extractSize(widget.element);
    final videoElement = HtmlVideoUtils.findVideoChild(parentElement);
    if (videoElement == null) return;

    final source = HtmlVideoUtils.findVideoSource(videoElement);
    if (source == null) return;

    _videoThumbnail = File(source.replaceAll(".mp4", ".thumbnail.mp4"));

    _videoPlayerController = VideoPlayerController.file(File(source))
      ..initialize().then((_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _videoPlayerController.seekTo(const Duration(milliseconds: 100));
          setState(() {
            _showVideoThumbnail = false;
          });
        });
        setState(() {});
      });
    _videoPlayerController.addListener(_listenForFirstFrameReady);
    _videoPlayerController.addListener(_showPlayButton);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position >=
          _videoPlayerController.value.duration) {
        _videoPlayerController.seekTo(const Duration(milliseconds: 100));
      }
    });
  }

  void _listenForFirstFrameReady() async {
    if (_videoPlayerController.value.buffered.isNotEmpty) {
      _videoPlayerController.removeListener(_listenForFirstFrameReady);
      setState(() {});
    }
  }

  void _showPlayButton() {
    _playButton?.setHidden(_videoPlayerController.value.isPlaying);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoControlsChild = widget.element.children.firstWhereOrNull(
        (element) =>
            element.attributes[HtmlAttributes.DATA_COMPONENT_TYPE] ==
            HtmlAttributeValues.VIDEO_CONTROLS);
    if (videoControlsChild == null) {
      SimpleLogger().info("No video controls found in video widget");
      return Container();
    }
    final playButton = HtmlWidgets.findChildByTypeAndRole(videoControlsChild,
        HtmlAttributeValues.IMAGE_BUTTON, HtmlAttributeValues.PLAY_VIDEO_ROLE);

    if (playButton == null) {
      SimpleLogger().info("No play button found in video widget");
      return Container();
    }
    final Map<String, void Function(NohevaWidgetState widget)>
        customOnTapCallbacks = {
      playButton.id: (NohevaWidgetState widget) {
        setState(() => _playButton ??= widget);
        widget.toggleHidden();
        _videoPlayerController.play();
      }
    };

    return Indexer(
      children: [
        Indexed(
          index: 2,
          child: Container(
            width: _videoSize.width,
            height: _videoSize.height,
            child: Stack(
              children: [
                Row(
                  children: [
                    DeferPointer(
                      child: FloatingActionButton(
                        heroTag: "back",
                        onPressed: () async =>
                            NavigationUtils.navigateToDefaultScreen(context),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
                // ),
                HtmlWidget(
                  videoControlsChild.outerHtml,
                  customWidgetBuilder: (element) =>
                      HtmlWidgets.buildCustomWidget(
                    element,
                    widget.resources,
                    widget.eventTriggers,
                    [],
                    [],
                    context,
                    customOnTapCallbacks,
                  ),
                ),
              ],
            ),
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
            child: _videoPlayerController.value.buffered.isNotEmpty
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
