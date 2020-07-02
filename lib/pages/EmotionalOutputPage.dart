import 'dart:math';

import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/UI/AnimatedBackground.dart';
import 'package:my_insight_out_demo/UI/SmoothColorAnimation.dart';
import 'package:my_insight_out_demo/UI/WaveAnimation.dart';
import 'package:my_insight_out_demo/pages/FirstPage.dart';

class EmoOutputPage extends StatefulWidget {
  String _emotion;

  EmoOutputPage(this._emotion);


  @override
  State<StatefulWidget> createState() => EmoOutputState();
}




class EmoOutputState extends State<EmoOutputPage> with TickerProviderStateMixin {

  AnimationController revealController;
  Animation<double> revealAnimation;
  TextEditingController emotionInputController = TextEditingController();

  @override
  void initState(){
    super.initState();
    revealController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    revealAnimation = CurvedAnimation(
      parent: revealController,
      curve: Curves.easeIn,
    );
    revealController.forward();
  }



  @override
  Widget build(BuildContext context) {
    String emotion = widget._emotion;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(child:AnimatedBackground(
            upperTransitionColor: Colors.cyan.shade400,
            lowerTransitionColor: Color(0xff00232e),
          )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularRevealAnimation(
              minRadius: 12.0,
              maxRadius: 700,
              center: Offset(20,300),
              child: Container(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white

                              ),
                              children: <TextSpan>[
                                TextSpan(text: "Je voelt je nu "),
                                TextSpan(text: emotion , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade300)),
                                TextSpan(text: " en dat is heel begrijpelijk. \n"),
                                TextSpan(text: "\nWe gaan hier samen dieper op het "),
                                TextSpan(text: emotion, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade300)),
                                TextSpan(text: "\n voelen in. \n\n"),
                                TextSpan(text: "Laten we beginnen met dit:", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                                TextSpan(text: "\n\nJe "),
                                TextSpan(text: emotion, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade300)),
                                TextSpan(text: " voelen voelt misschien niet altijd prettig. Er zijn situaties dat je je liever anders zou voelen.  \n\n"),
                                TextSpan(text: "Weet dat het verzetten tegen deze emotie meestal averechts werkt. Hoe vervelend "),
                                TextSpan(text: emotion, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade300)),
                                TextSpan(text: " zijn nu ook voelt, het werkt beter om dit volledig te accepteren. \n\n"),
                                TextSpan(text: "Neem daarom nu "),
                                TextSpan(text: "diep adem", style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " en weet dat elke emotie waarde met zich mee draagt. Zonder dalen geniet je niet van de pieken \n\n"),
                                TextSpan(text: "Zelfs "),
                                TextSpan(text: emotion, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade300)),
                                TextSpan(text: " voelen is een waardevolle ervaring. Ben dankbaar dat je deze emotie nu voelt.\n"),


                              ]
                          )
                      ),


                      SizedBox(height: 20.0,),
                      RaisedButton(
                        textColor: Colors.white,
                        onPressed: () => Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => FirstPage())),
                        color: Color(0xff054b57),
                        hoverColor: Color(0xff3e7784),
                        padding: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white70),
                        ),
                        child: Text(
                          "Dank Je!",
                          style: TextStyle(color: Colors.white,fontSize: 18.0),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
              animation: revealAnimation,
            ),
          ),
          onBottom(AnimatedWave(
            height: 50,
            speed: 2,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 1,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 80,
            speed: 1,
            offset: 0.5*pi,
          )),
        ],
      ),
    );
  }
  onBottom(Widget child) => Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  );
}

