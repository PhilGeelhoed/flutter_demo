import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/UI/AnimatedBackground.dart';
import 'package:my_insight_out_demo/UI/SmoothColorAnimation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_insight_out_demo/UI/Transitions/FadeTransition.dart';
import 'package:my_insight_out_demo/UI/WaveAnimation.dart';
import 'package:my_insight_out_demo/pages/LoginPage.dart';

//----------------------------------------------------------------------------------------------------------------------//
//Splash Screen for the Mio demo app
//For now the spash screen is fixed to show its awesome color transition.
//You can click the little text near the loading icon to continue to the login page
//---------------------------------------------------------------------------------------------------------------------//


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  Animation<double> _logoAnimation, _textAnimation;
  AnimationController _logoAnimationController, _textAnimationController;

  @override
  void initState() {
    super.initState();
    //Timer(Duration(seconds: 10), () => Navigator.push(context, FadeRoute(page: LoginPage())));
    //init animation controllers
    _logoAnimationController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this
    );

    _textAnimationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );





    //init logo animation
    _logoAnimation = CurvedAnimation(
        parent: _logoAnimationController,
        curve: Curves.linear
    );
    _logoAnimation.addListener(() => this.setState(() {}));
    _logoAnimationController.forward();


    //Init delayed textAnimation
    _textAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Interval(0.6,1.0, curve: Curves.fastOutSlowIn)
      )
    );
    _textAnimation.addListener(() => this.setState(() {}));
    _textAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {

    AssetImage logo = AssetImage('assets/logoTransparentNerves.png');
    return Stack (
        fit: StackFit.expand,
        children: <Widget>[
          //Positioned.fill(child:SmoothColorAnimation(1.0,69.0)),
          Positioned.fill(child: AnimatedBackground()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                opacity: _logoAnimationController.value,
                child:  Image(
                  image: logo,
                  width: 400,
                  height: 400,

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  SizedBox(
//                    width: 160.0, height: 20.0,
//                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: RotateAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: ["My Insight Out", "Jouw zelf-coach tool", "Demo edition"],
                      textStyle: TextStyle(fontSize: 30.0, fontFamily: "Lobster", color: Colors.white),
                      textAlign: TextAlign.center,
                      alignment: AlignmentDirectional.center,
                    ),
                  ),

//                  SizedBox(
//                    width: 50.0, height: 20.0,
//                  ),

                ],
              ),

//
              SizedBox(
                height: 30.0,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.transparent,
                      textColor: Colors.white,
                      onPressed: () => Navigator.push(context, FadeRoute(page: LoginPage())),
                      child: Text(
                        'Splashscreen demo version: \n'
                            'Click here to continue to login'
                      ),
                    ),
                    CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white70
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    )
                  ],
                ),


            ],
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
         );
  }

  onBottom(Widget child) => Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  );
}