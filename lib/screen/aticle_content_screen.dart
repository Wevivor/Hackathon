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
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '🥗 간편한 샐러드',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green),
                  ),
                ),
                Row(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                      child: Image.asset('images/a1.png')),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '1.아보카도 샐러드',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' -아보카도'),
                        Text(' -계란'),
                        Text(' -양상추'),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          '2.단호박 샐러드',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' -단호박'),
                        Text(' -당근'),
                        Text(' -건포도'),
                        Text(' -오이'),
                      ]),
                ]),

                //항목2
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '🍳 계란으로 만드는 다양한 요리',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFFFD001)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Image.asset('images/a2.png'),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' 이번주 : 계란 토스트 ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          ' 다음주 : 계란 볶음밥 또는 오므라이스',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    )),

                //항목3
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '🍎 과일 보관법',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red),
                  ),
                ),
                Row(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                      child: Image.asset('images/a1.png')),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '1.사과',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' -수분이 날라가지 않도록 밀봉 후 보관'),
                        Text(' -계란'),
                      ]),
                ]),
              ]),
        ));
  }
}
