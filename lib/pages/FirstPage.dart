import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/UI/AnimatedBackground.dart';
import 'package:my_insight_out_demo/UI/ChewieVideoScreen.dart';
import 'package:my_insight_out_demo/UI/SmoothColorAnimation.dart';
import 'package:my_insight_out_demo/pages/SplashPage.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'EmotionInputPage.dart';
import 'EmotionalOutputPage.dart';


//----------------------------------------------------------------------------------------------------------------------//
// Page that is shown after login. It contains the logo, a little introductionay video
// and a option to say if you already know MIO or not.
//---------------------------------------------------------------------------------------------------------------------//


class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FirstPageState();
  }

class FirstPageState extends State<FirstPage> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  Future<void> _initVideoState;







  @override
  void initState(){
    _videoPlayerController = VideoPlayerController.asset('videos/video.mp4');
//    _videoPlayerController = VideoPlayerController.network(
//        "https://vimeo.com/375899848/3ad1f74238");

   _chewieController = ChewieController(
     videoPlayerController: _videoPlayerController,
     looping: true,
     autoInitialize: true,
     autoPlay: false,
     materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.deepPurple,
        bufferedColor: Colors.lightGreen,
      ),
     errorBuilder: (context, errorMessage) {
       return Center(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
             child: Text(
               errorMessage, style: TextStyle(color: Colors.white)
             ),
         ),
       );
     }
   );

    super.initState();
  }

  @override
  void dispose(){
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }




  AssetImage logo = AssetImage('assets/logo.png');



  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(child: AnimatedBackground(
                upperTransitionColor: Color(0xff3e7784),
                lowerTransitionColor: Color(0xff00232e))
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image(
                    image: logo,
                    width: 150.0,
                    height: 150.0,

                  ),
                )
                ,
                Text(
                  "Welkom!\n",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                  ),

                ),
                Text(
                  "Introductie filmpje:",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  height: 225.0,
                  child: VisibilityDetector(
                    key: Key("swag-swag"),
                    onVisibilityChanged: (VisibilityInfo info) {
                      debugPrint("${info.visibleFraction} of my widget is visible");
                      if(info.visibleFraction == 0){
                        _videoPlayerController.pause();
                      }
                      else{
                        _videoPlayerController.play();
                      }
                    },
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Ben je al bekend met "),
                          TextSpan(text: "My Insight Out?", style: TextStyle(fontWeight: FontWeight.bold))
                        ]
                    )
                ),
                Text("Of is dit je eerste keer?", style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      textColor: Colors.white,
                      onPressed: () => Navigator.of(context).push( CupertinoPageRoute(builder: (BuildContext context) => EmoOutputPage("Nieuw hier")))
                      ,
                      color: Color(0xff054b57),
                      hoverColor: Color(0xff3e7784),
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white70),
                      ),
                      child: Text(
                        "ik ben hier nieuw",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    RaisedButton(
                      textColor: Colors.white,
                      onPressed: () => Navigator.of(context).push( CupertinoPageRoute(builder: (BuildContext context) => EmoInputPage()))
                      ,
                      color: Color(0xff054b57),
                      hoverColor: Color(0xff3e7784),
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white70),
                      ),
                      child: Text(
                        "Ik ken My Insight Out",
                        style: TextStyle(color: Colors.white,fontSize: 18.0),
                      ),
                    )
                  ],
                )



              ],

            )


          ],
        )
    );

  }

}








