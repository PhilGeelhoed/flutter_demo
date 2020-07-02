import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  final Color beginColor, upperTransitionColor, lowerTransitionColor;
  final Duration color1Duration, color2Duration;

  AnimatedBackground({this.beginColor=const Color(0xff054b57),
    this.upperTransitionColor=Colors.deepOrange, this.lowerTransitionColor=Colors.deepPurple,
    this.color1Duration=const Duration(seconds: 7), this.color2Duration=const Duration(seconds: 10)});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 7),
          ColorTween(begin: beginColor, end: upperTransitionColor)),
      Track("color2").add(Duration(seconds: 10),
          ColorTween(begin: beginColor, end: lowerTransitionColor))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}