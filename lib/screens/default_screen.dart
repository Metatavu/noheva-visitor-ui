import "dart:async";
import "dart:ui";
import "package:flutter/rendering.dart";
import "package:fwfh_chewie/fwfh_chewie.dart";
import "package:html/parser.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/database/dao/keys_dao.dart";
import "package:simple_logger/simple_logger.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:video_player/video_player.dart";

class MyWidgetFactory extends WidgetFactory with ChewieFactory {}

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  bool _isDeviceApproved = false;
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    keysDao.checkIsDeviceApproved().then(
      (value) {
        if (!value) {
          Timer.periodic(const Duration(seconds: 5), (timer) async {
            SimpleLogger().info("Checking whether device has been approved...");
            bool isApproved = await keysDao.checkIsDeviceApproved();
            setState(() => _isDeviceApproved = isApproved);
            if (isApproved) {
              SimpleLogger().info("Device is approved!");
              timer.cancel();
            }
          });
        }
        setState(() => _isDeviceApproved = value);
      },
    );
  }

  final testHtml = """
    <div>
      <video>
        <source src="https://s3.eu-central-1.amazonaws.com/static.metatavu.io/noheva/uhd_29%2C97.mp4" type="video/mp4">
      </video>
    </div>
  """;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: HtmlWidget(
            testHtml,
            factoryBuilder: () => MyWidgetFactory(),
            // customWidgetBuilder: (element) {
            //   // if (element.localName == "video") {
            //   //   final sourceElement = element.children
            //   //       .firstWhere((element) => element.localName == "source");
            //   //   final videoSrc = sourceElement.attributes["src"];
            //   //   final videoUrl = Uri.parse(videoSrc ?? "");
            //   //   _controller = VideoPlayerController.networkUrl(videoUrl)
            //   //     ..initialize().then((_) => setState(() {}));
            //   //   return Container(
            //   //     width: 300,
            //   //     height: 300,
            //   //     child: _controller != null
            //   //         ? _controller!.value.isInitialized
            //   //             ? AspectRatio(
            //   //                 aspectRatio: _controller!.value.aspectRatio,
            //   //                 child: VideoPlayer(_controller!),
            //   //               )
            //   //             : Container()
            //   //         : Container(),
            //   //     // FutureBuilder(
            //   //     //   future: _initializeVideoPlayerFuture,
            //   //     //   builder: ((context, snapshot) {
            //   //     //     if (snapshot.connectionState == ConnectionState.done &&
            //   //     //         _controller != null) {
            //   //     //       return Container(
            //   //     //           color: Colors.red,
            //   //     //           width: 300,
            //   //     //           height: 300,
            //   //     //           child: AspectRatio(
            //   //     //             aspectRatio: _controller!.value.aspectRatio,
            //   //     //             child: VideoPlayer(_controller!),
            //   //     //           ));
            //   //     //     } else {
            //   //     //       return const Center(
            //   //     //         child: Text("VIDEOTA EI OLE!!!!"),
            //   //     //       );
            //   //     //     }
            //   //     //   }),
            //   //     // ),
            //   //   );
            //   // }

            //   if (element.localName == "img") {
            //     var image = Image.network(element.attributes["src"]!);
            //     return GestureDetector(
            //       onTap: () {
            //         print("Tapped");
            //       },
            //       child: image,
            //     );
            //   }

            //   if (element.localName == "button") {
            //     return ElevatedButton(
            //       onPressed: () {
            //         print("Pressed");
            //       },
            //       child: Text(element.text),
            //     );
            //   }

            //   return null;
            // },
          ),
        ),
      ),
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(_isDeviceApproved
    //         ? AppLocalizations.of(context)!.deviceIsApproved
    //         : AppLocalizations.of(context)!.deviceNotYetApproved),
    //   ],
    // ),
  }
}
