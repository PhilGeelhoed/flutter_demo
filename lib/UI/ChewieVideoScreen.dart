import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class ChewieVideoScreen extends StatefulWidget{
  String videoURL;
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieVideoScreen(
  {@required this.videoPlayerController,
  this.looping,
    this.videoURL, Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() => ChewieVideoScreenState();


}

class ChewieVideoScreenState extends State<ChewieVideoScreen>{
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    //wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      //prepare video to be played and displayed
      autoInitialize: true,
      looping: widget.looping,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.purpleAccent,
        handleColor: Color(0xff054b57),
        backgroundColor: Colors.black54,
      ),
      //for errors
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Chewie(
       controller: _chewieController,
     ),
   );
  }

  @override
  void dispose() {
    super.dispose();
    //IMPORTANT dispose all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
