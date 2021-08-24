import 'package:agile_hackathon/makeclay_data.dart';
import 'package:agile_hackathon/widget/bottombar.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MakeClay extends StatelessWidget {
  static String id = "makeclay_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'CLAY 만들기',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true, //타이틀 중앙배열
        // elevation: 0.0, //앱바하단 경계선 제거
        actions: [
          TextButton(
            child: Text('완성'),
            style: TextButton.styleFrom(
              primary: Colors.yellow, // foreground
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () async {
              final nickname = Clay('닉네임', '이미지파일이름'); //textfield에 입력받은data
              final result = await Navigator.push(
                //push속성 : 다음화면으로 이동 -새로운 화면이 표시되어도 이전 화면은 메모리에 남게 됨.
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(), //화면이동 코드
                ),
              );
            },
          )
        ],
        backgroundColor: Colors.black,
      ),
//화면부분
      body: Container(
        color: Colors.black,
        child: Center(
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${FirebaseAuth.instance.currentUser!.displayName}',
                          style: TextStyle(
                            color: Colors.yellow,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Text(
                          '님만의 클레이 캐릭터를 만들어 보세요!',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                        ),
//                        SizedBox(
//                            width: 60,
//                            child: TextButton(
//                              style: ButtonStyle(
//                                // backgroundColor: MaterialStateProperty.all(Colors.lime),
//                                padding: MaterialStateProperty.all(
//                                  EdgeInsets.only(left: 8, right: 8),
//                                ),
//                              ),
//                              child: Text(
//                                'logout',
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  backgroundColor: Colors.black,
//                                ),
//                              ),
//                              onPressed: FirebaseAuth.instance.signOut,
//                            )
                      ],
                    ),
                  ),
                  //완성된 캐릭터
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/pink.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/pink.jpg',
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: '닉네임 입력',
                          contentPadding: EdgeInsets.only(bottom: -15)),
                    ),
                  ),
                  SizedBox(height: 30),
                  SelectClay(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//하단 클레이 커스텀 화면
class SelectClay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectButton(),
            SizedBox(height: 50),
            //커스텀 창
            Container(
              color: Colors.black,
              child: Image.asset(
                'images/face.png',
                height: 100,
              ),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 10)),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}

//커스텀버튼 누르면 나올 하단 커스텀 창
class FaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectButton(),
            SizedBox(height: 50),
            //커스텀 창
            Container(
              color: Colors.black,
              child: Image.asset(
                'images/face.png',
                height: 100,
              ),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 10)),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}

class HairScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectButton(),
            SizedBox(height: 50),
            //커스텀 창
            Container(
              color: Colors.black,
              child: Image.asset(
                'images/cha.png',
                height: 100,
              ),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 10)),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}

//
//클레이 커스텀 선택 버튼: 클레이색,헤어,표정,상의색,배경색 버튼
class SelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ButtonTheme(
            minWidth: 20, //버튼의 최소 가로 길이
            height: 10, //버튼의 세로 길이
            shape: RoundedRectangleBorder(
                //버튼을 둥글게 처리
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              //ButtonTheme의 child로 버튼 위젯 삽입
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.lime)   // border line color
                  ),
                ),
              ),
              onPressed: () {
                FaceScreen();
              },
              child: Text(
                '클레이색',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ButtonTheme(
            minWidth: 20, //버튼의 최소 가로 길이
            height: 10, //버튼의 세로 길이
            shape: RoundedRectangleBorder(
                //버튼을 둥글게 처리
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              //ButtonTheme의 child로 버튼 위젯 삽입
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.lime)   // border line color
                  ),
                ),
              ),
              onPressed: () {
                HairScreen();
              },
              child: Text(
                '헤어 스타일',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ButtonTheme(
            minWidth: 20, //버튼의 최소 가로 길이
            height: 10, //버튼의 세로 길이
            shape: RoundedRectangleBorder(
                //버튼을 둥글게 처리
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              //ButtonTheme의 child로 버튼 위젯 삽입
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.lime)   // border line color
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                '표정',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
//상의 색 버튼
          ButtonTheme(
            minWidth: 20, //버튼의 최소 가로 길이
            height: 10, //버튼의 세로 길이
            shape: RoundedRectangleBorder(
                //버튼을 둥글게 처리
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              //ButtonTheme의 child로 버튼 위젯 삽입
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.lime)   // border line color
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                '상의 색',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
//배경색 버튼
          ButtonTheme(
            minWidth: 20, //버튼의 최소 가로 길이
            height: 10, //버튼의 세로 길이
            shape: RoundedRectangleBorder(
                //버튼을 둥글게 처리
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              //ButtonTheme의 child로 버튼 위젯 삽입
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.lime)   // border line color
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                '배경색',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
