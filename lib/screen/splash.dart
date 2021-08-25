import 'dart:async';

import 'package:agile_hackathon/app.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final String imageLogoName = 'images/claylogo.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: new Container(
            //height : MediaQuery.of(context).size.height,
            //color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.384375),
                Container(
                  child: Image.asset(
                    imageLogoName,
                    width: screenWidth * 0.616666,
                    height: screenHeight * 0.0859375,
                  ),
                ),
                Text('당신이 본 콘텐츠가 당신을 표현하는 세상!'),
                Expanded(child: SizedBox()),
                Align(
                  child: Text("© Copyright 2021, WEVIVOR",
                      style: TextStyle(
                        fontSize: screenWidth * (14 / 360),
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0625,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
    });
  }
}
