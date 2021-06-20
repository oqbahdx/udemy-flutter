import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLoading;

  const Videos({this.videoPlayerController, @required this.isLoading});

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  ChewieController chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.isLoading,
      aspectRatio: 16/9,
      autoInitialize: true,

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewieController,


      ),
    );
  }
}

class VideoDisplay extends StatefulWidget {
 final String videoUrl;

  const VideoDisplay({@required this.videoUrl});

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Videos(videoPlayerController:
      VideoPlayerController.network(widget.videoUrl),
          isLoading: true),
    ) ;
  }
}
