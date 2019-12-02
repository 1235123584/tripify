import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;



  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacementNamed('/home'));
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset(
                          'assets/tripify.jpeg',
                          width: animation.value * 80,
                          height: animation.value * 80,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top:65.0)),
                    tripify,
                    Padding(padding: EdgeInsets.only(top: 150.0)),
                    moto,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Text tripify = Text(
  'Tripify',
  style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: Colors.white
  ),
);

Text moto = Text(
  'New Friends on Way',
  style: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: Colors.white
  ),
);

Column column2 = Column(
  mainAxisAlignment: MainAxisAlignment.end,
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Padding(padding: EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          "assets/tripify.jpeg",
          height: 80.0,
          width: 80.0,
          fit: BoxFit.scaleDown,
        )
    ),
  ],
);