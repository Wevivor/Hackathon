import 'package:flutter/material.dart';

class Articlay extends StatelessWidget {
  const Articlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '아티클레이',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true, //타이틀 중앙배열
        elevation: 0.0, //앱바 하단 그림자 선효과 제거
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF000000),
              Color(0xFF0E0E0E),
              Color(0xFF5C5C5C),
              Color(0xFFADADAD),
              Color(0xFFD8D8D8),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(children: [
            Container(
              child: Text('아티클레이 모음'),
            ),
          ]),
        ),
      ),
    );
  }
}
