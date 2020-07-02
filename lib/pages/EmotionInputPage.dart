import 'dart:math';

import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/UI/AnimatedBackground.dart';
import 'package:my_insight_out_demo/UI/SmoothColorAnimation.dart';
import 'package:my_insight_out_demo/UI/WaveAnimation.dart';
import 'package:my_insight_out_demo/pages/EmotionalOutputPage.dart';

class EmoInputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmoInputState();
  }



class EmoInputState extends State<EmoInputPage> with TickerProviderStateMixin {
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
    AssetImage logo = AssetImage('assets/logo.png');
    String input;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff054b57),
        title: Text("Welke Emotie Voel Je Nu"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(child:AnimatedBackground(
            upperTransitionColor: Color(0xff3e7784),
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
                          Image(
                            image: logo,
                            alignment: Alignment.center,
                            width: 150.0,
                          ),
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
                                TextSpan(text: "We hebben allemaal wel eens last van onze "),
                                TextSpan(text: "emoties.\n", style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "\nDeze tool laat je beter bewust worden van de emotie die je nu het meest voelt\n\n"),
                                TextSpan(text: "Om je beter te kunnen helpen "),
                                TextSpan(text: "voer je hieronder je huidige emotie in", style: TextStyle(fontWeight: FontWeight.bold))
                              ]
                          )
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: TextField(
                          controller: emotionInputController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            hintText: "Voer hier je emotie in",
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.0
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.white70,
                                width: 2.0,
                              )
                            )
                          ),
                        ),

                      ),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        textColor: Colors.white,
                        onPressed: () => Navigator.of(context).push( CupertinoPageRoute(builder: (BuildContext context) => EmoOutputPage(emotionInputController.text))),
                        color: Color(0xff054b57),
                        hoverColor: Color(0xff3e7784),
                        padding: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white70),
                        ),
                        child: Text(
                          "Volgende",
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