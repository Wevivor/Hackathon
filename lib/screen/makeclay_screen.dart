import 'package:agile_hackathon/makeclay_data.dart';
import 'package:agile_hackathon/screen/mypage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MakeClay extends StatelessWidget {
  static String id = "makeclay_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '나만의 클레이 캐릭터 생성하기',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true, //타이틀 중앙배열
        elevation: 0.0, //띄움효과 초기화
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.next_plan),
            onPressed: () async {
              final nickname = Clay('닉네임', '이미지파일이름'); //textfield에 입력받은data
              final result = await Navigator.push(
                //push속성 : 다음화면으로 이동 -새로운 화면이 표시되어도 이전 화면은 메모리에 남게 됨.
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(nickname: nickname), //화면이동 코드
                ),
              );
            },
          ),
          // Text(
          //   '완료',
          //   style: TextStyle(color: Colors.black),
          // )
        ],
        backgroundColor: Colors.white,
      ),
//화면부분
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                      '🧸${FirebaseAuth.instance.currentUser!.displayName}님만의 클레이 캐릭터를 만들어 보세요!'),
                  SizedBox(
                      width: 60,
                      child: TextButton(
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 8, right: 8),
                          ),
                        ),
                        child: Text(
                          'logout',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        onPressed: FirebaseAuth.instance.signOut,
                      )),
                ],
              ),
            ),
//완성된 캐릭터
            Container(
              decoration: BoxDecoration(
                  //박스테두리
                  border: Border.all(color: Colors.black26, width: 4)),
              child: Image.asset(
                'images/character.jpg',
                width: 200,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
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
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 1,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
