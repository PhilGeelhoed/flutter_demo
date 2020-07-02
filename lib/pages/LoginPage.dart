import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/UI/AnimatedBackground.dart';
import 'package:my_insight_out_demo/UI/LoginFields.dart';
import 'package:my_insight_out_demo/UI/SmoothColorAnimation.dart';
import 'package:my_insight_out_demo/UI/Transitions/FadeIn.dart';
import 'package:my_insight_out_demo/UI/Transitions/ScaleTransition.dart';
import 'package:my_insight_out_demo/UI/WaveAnimation.dart';

import 'FirstPage.dart';

//----------------------------------------------------------------------------------------------------------------------//
//This is the login page of the MIO demo app. For now there is no database connected to the app
//You can just press login and you will continue to the main app
//---------------------------------------------------------------------------------------------------------------------//


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

  }




class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }


  Future<bool> _onBackPressed(){
    return showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      backgroundColor: const Color(0xff054b57),
      title: Text(
        "Wil je de app nu verlaten?",
        style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold
      ),
      ),
      actions: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white60,
          child: Text("Ja"),
          onPressed: () => exit(0),
        ),
        SizedBox(
          width: 20.0,
        ),
        FloatingActionButton(
          backgroundColor: Colors.white60,
          child: Text("Nee"),
          onPressed: () => Navigator.pop(context, false),
        )
      ],
    ),
    );

  }



  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('assets/logo.png');
    return  Scaffold(
        resizeToAvoidBottomInset: true,
      body: WillPopScope(
          onWillPop: _onBackPressed,
          child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(child:AnimatedBackground(
                  upperTransitionColor: Color(0xff3e7784),
                  lowerTransitionColor: Color(0xff00232e),
                )),
                SingleChildScrollView(
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center
                    ,
                    children: <Widget>[
                      FadeIn(1.0, Image(
                        image: logo,
                        alignment: Alignment.center,
                        width: 150.0,
                      ),
                      ),

                      SizedBox(
                        width: 20.0, height: 50.0,
                      ),
                      FadeIn(1.5, Material(
                        type: MaterialType.transparency,
                        child: Text(
                          "Login op de Tool",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 27.0,
                              color: Colors.white
                          ),
                        ),
                      )
                      ),
                      SizedBox(height: 10.0),
                      FadeIn(2.0, Container(
                          margin: EdgeInsets.all(3.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white30,
                          ),
                          child: LoginFields()

                      )
                      ),
                      SizedBox( height: 30.0,),
                      FadeIn(2.0, RaisedButton(
                        onPressed: () => Navigator.push(context, ScaleRoute(page: FirstPage()) ),
                        textColor: Colors.white,
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF3e7784),
                                Color(0xFF3e7784),
                                Color(0xFF3e7784),
                              ],
                            ),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 7.0, 20.0, 7.0),
                          child: const Text(
                              'Log in',
                              style: TextStyle(fontSize: 21)
                          ),
                        ),
                      )
                      ),
                    ],
                  ),
                ),
                onBottom(AnimatedWave(
                  height: 80,
                  speed: 1,
                  offset: 0.5*pi,
                )),


              ])

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