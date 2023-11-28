import "dart:io";

import "package:flutter/widgets.dart";
import "package:video_player/video_player.dart";

/// Widget for playing videos
class VideoWidget extends StatefulWidget {
  final String src;
  final bool? looping;
  final bool? controls;
  final bool? autoPlay;

  const VideoWidget({
    Key? key,
    required this.src,
    this.looping,
    this.controls,
    this.autoPlay,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoWidgetState();
}

/// State for [VideoWidget]
class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  /// Initializes video player and sets its source as [src]
  void _initializeVideoPlayer(String src) {
    _controller = VideoPlayerController.file(File(src))
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(widget.src);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: constraints.maxWidth / constraints.maxHeight,
              child: VideoPlayer(_controller),
            )
          : const Text("Loading..."),
    );
  }
}
