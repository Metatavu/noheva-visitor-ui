import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  final List<String> _videos = [
    "https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/fhd_25.mp4",
    "https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/fhd_29%2C97.mp4",
    "https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/fhd_50.mp4",
    "https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/uhd_30.mp4",
    "https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/uhd_29%2C97.mp4",
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_videos[3])
      ..initialize().then((_) {
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: constraints.maxWidth / constraints.maxHeight,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
