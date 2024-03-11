import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ZoomPlayerVideoPlayer extends StatefulWidget {
  String videoUrl;
  ZoomPlayerVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ZoomPlayerVideoPlayer> createState() => _ZoomPlayerVideoPlayerState();
}

class _ZoomPlayerVideoPlayerState extends State<ZoomPlayerVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
    ;
  }
}
