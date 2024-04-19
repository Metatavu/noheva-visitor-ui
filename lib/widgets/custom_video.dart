import "dart:io";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:html/dom.dart" as dom;
import "package:indexed/indexed.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:noheva_visitor_ui/widgets/noheva_widget.dart";
import "package:noheva_visitor_ui/widgets/video_widget.dart";
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
  late VideoPlayerController _videoPlayerController;
  NohevaWidgetState? _playButton;

  @override
  void initState() {
    super.initState();
    final videoChild = widget.element.children.firstWhereOrNull(
        (element) => element.localName == CustomHtmlWidgets.VIDEO);
    if (videoChild == null) {
      return;
    }
    final sourceChild = videoChild.children.firstWhereOrNull(
        (element) => element.localName == CustomHtmlWidgets.SOURCE);

    if (sourceChild == null) {
      return;
    }

    final source = HtmlWidgets.extractAttribute(sourceChild,
        attribute: CustomHtmlWidgets.SRC);

    if (source == null) {
      return;
    }
    _videoPlayerController = VideoPlayerController.file(File(source))
      ..initialize().then((_) => setState(() {}))
      ..addListener(() {
        _playButton?.setHidden(_videoPlayerController.value.isPlaying);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = HtmlWidgets.extractSize(widget.element);

    final videoControlsChild = widget.element.children.firstWhereOrNull(
        (element) =>
            element.attributes["data-component-type"] == "video-controls");
    final playButton = videoControlsChild?.children.firstWhereOrNull(
        (element) =>
            element.attributes["data-component-type"] == "image-button");
    if (playButton == null) {
      return Container();
    }

    final Map<String, void Function(NohevaWidgetState widget)>
        customOnTapCallbacks = {
      playButton.id: (NohevaWidgetState widget) {
        setState(() {
          _playButton ??= widget;
          _videoPlayerController.play();
        });
      }
    };

    return Indexer(
      children: [
        Indexed(
          index: 1,
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                HtmlWidget(
                  videoControlsChild?.outerHtml ?? "",
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
          index: 0,
          child: Container(
            width: size.width,
            height: size.height,
            child: VideoWidget(
              videoPlayerController: _videoPlayerController,
            ),
          ),
        ),
      ],
    );
  }
}
