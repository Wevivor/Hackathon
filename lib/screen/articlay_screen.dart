import 'package:agile_hackathon/screen/share_screen.dart';
import 'package:flutter/material.dart';

class Articlay extends StatelessWidget {
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF0E0E0E),
              Color(0xFF5C5C5C),
              Color(0xFFADADAD),
              Color(0xFFD8D8D8),
              Colors.white
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              '아티클레이',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            centerTitle: true, //타이틀 중앙배열
            // elevation: 0.0, //앱바하단 경계선 제거
            actions: [
              IconButton(
                onPressed: () async {
                  await Navigator.push(
                    //push속성 : 다음화면으로 이동 -새로운 화면이 표시되어도 이전 화면은 메모리에 남게 됨.
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Center(child: ShareScreen()), //화면이동 코드
                    ),
                  );
                },
                icon: Icon(Icons.settings),
              ),
            ],
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 300,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: ctrl,
                        children: [
                          Container(color: Colors.yellow),
                          Container(color: Colors.green),
                          Container(color: Colors.yellow),
                          Container(color: Colors.red)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
