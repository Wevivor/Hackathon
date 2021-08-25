import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black), //앱바 버튼색
        title: Text(
          'ARTICLAY',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       'images/c4.png',
        //       fit: BoxFit.contain,
        //       height: 30,
        //     ),
        //   ],
        // ),
        centerTitle: true, //타이틀 중앙배열
        elevation: 0.0,
      ), //앱바 하단 그림자 선효과 제거
      backgroundColor: Colors.white,

////////본문//////////
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text('간편한 샐러드'),
          Row(children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('images/a1.png'))
          ]),
        ],
      ),
    );
  }
}
