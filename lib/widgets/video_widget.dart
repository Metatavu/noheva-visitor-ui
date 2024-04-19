// import "package:flutter/widgets.dart";
// import "package:video_player/video_player.dart";

// /// Widget for playing videos
// class VideoWidget extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;

//   const VideoWidget({
//     Key? key,
//     required this.videoPlayerController,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _VideoWidgetState();
// }

// /// State for [VideoWidget]
// class _VideoWidgetState extends State<VideoWidget> {
//   /// Initializes video player and sets its source as [src]
//   void _initializeVideoPlayer() {
//     widget.videoPlayerController
//         .addListener(() => print(widget.videoPlayerController));
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) =>
//           widget.videoPlayerController.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: constraints.maxWidth / constraints.maxHeight,
//                   child: VideoPlayer(widget.videoPlayerController),
//                 )
//               : const Text("Loading..."),
//     );
//   }
// }

import "package:flutter/material.dart";
import "package:video_player/video_player.dart";

class VideoWidget extends StatelessWidget {
  final VideoPlayerController videoPlayerController;

  const VideoWidget({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: constraints.maxWidth / constraints.maxHeight,
                  child: VideoPlayer(videoPlayerController),
                )
              : const Text("Loading..."),
    );
  }
}
