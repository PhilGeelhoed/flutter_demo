import 'package:flutter/material.dart';
import 'package:my_insight_out_demo/pages/EmotionInputPage.dart';
import 'package:my_insight_out_demo/pages/FirstPage.dart';
import 'package:my_insight_out_demo/pages/LoginPage.dart';
import 'package:my_insight_out_demo/pages/SplashPage.dart';
import 'package:flutter/services.dart';




//we zijn gebleven bij 47 min in de tutorial

//void main() {
//WidgetsFlutterBinding.ensureInitialized();
//  SystemChrome.setPreferredOrientations(
//    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
//  );
//  runApp(new MaterialApp(
//    theme: ThemeData(primaryColor: Colors.green , accentColor: Colors.pink ),
//    debugShowCheckedModeBanner: false,
//    home: SplashPage(),
//  ));
//}



//debug main
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Color(0xff3e7784) , accentColor: Colors.white ),
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}