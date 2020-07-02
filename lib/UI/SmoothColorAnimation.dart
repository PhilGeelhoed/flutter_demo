import 'package:flutter/material.dart';

class SmoothColorAnimation extends StatefulWidget {
  final double _flowRate;
  final double _range;
  int _colorR,
      _colorG,
      _colorB;

  SmoothColorAnimation(this._flowRate, this._range):
    this._colorR = 5,
    this._colorG = 75,
    this._colorB = 87;


  SmoothColorAnimation.withRGBColor(this._flowRate, this._range,
      this._colorR, this._colorG, this._colorB);

  @override
  SmoothColorAnimationState createState() => SmoothColorAnimationState();
}

class SmoothColorAnimationState extends State<SmoothColorAnimation> with SingleTickerProviderStateMixin {
  Animation<double> _colorAnimation;
  AnimationController _colorAnimationController;
  double _flowRate, _range ;

  @override
  void initState() {
    _flowRate = widget._flowRate;
    _range = widget._range;
    int duration = (10*_flowRate).round();

    super.initState();
    _colorAnimationController = AnimationController(
      duration: Duration(seconds: duration),
        vsync: this
    );

    _colorAnimation = CurvedAnimation(
        parent: _colorAnimationController,
        curve: Curves.linear
    );


    _colorAnimation.addListener(() => this.setState(() {}));
    _colorAnimationController.forward();
    _colorAnimationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    //set animation values
    double animationFlowRate = _flowRate * _colorAnimationController.value;
    int animationFlowValue = animationFlowRate.round();
    double animationRange = _range * _colorAnimationController.value;
    int animationRangeValue = animationRange.round();

    //widget swagger
    return Container (
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight ,
              colors: [

                Color.fromRGBO(widget._colorR + (0.5*animationRangeValue).round(), widget._colorG, widget._colorB + animationRangeValue , 1.0),
                Color.fromRGBO(widget._colorR + animationRangeValue, widget._colorG, widget._colorB - (0.5*animationRangeValue).round() , 1.0),


              ]
          )
      ),
    );
  }
}

/*
    colors: [
                Color.fromRGBO(0, 95,99 + animationRangeValue , 1.0),
                Color.fromRGBO(5, 75, 87 , 1.0),
                Color.fromRGBO(5, 75, 87 , 1.0),
                Color.fromRGBO(5 + (animationRangeValue/2).round(), 75 + (animationRangeValue/2).round(), 87 , 1.0),
                Color.fromRGBO(0 + animationRangeValue, 74 + animationRangeValue, 64, 1.0),

              ]
 */

