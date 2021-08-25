import 'package:agile_hackathon/makeclay_data.dart';
import 'package:agile_hackathon/widget/bottombar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
String newNickname = "";

class MakeClay extends StatelessWidget {
  static String id = "makeclay_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'CLAY 만들기',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
              _firestore
                  .collection('${FirebaseAuth.instance.currentUser!.uid}')
                  .doc("userInfo")
                  .set({
                'uid': '${FirebaseAuth.instance.currentUser!.uid}',
                'userEmail': '${FirebaseAuth.instance.currentUser!.email}',
                'userName': '${FirebaseAuth.instance.currentUser!.displayName}',
                'userNickname': '$newNickname',
                'userClayImage': 'dd'
              });
              _firestore
                  .collection('${FirebaseAuth.instance.currentUser!.uid}')
                  .doc("userContents")
                  .collection("userContents")
                  .add({});
              final nickname = Clay('닉네임', '이미지파일이름'); //textfield에 입력받은data
              final result = await Navigator.push(
                //push속성 : 다음화면으로 이동 -새로운 화면이 표시되어도 이전 화면은 메모리에 남게 됨.
                context,
                MaterialPageRoute(
                  builder: (context) => Center(child: BottomBar()), //화면이동 코드
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${FirebaseAuth.instance.currentUser!.displayName}',
                      style: TextStyle(
                        color: Colors.yellow,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'images/pink.jpg',
                  width: 160.0,
                  height: 160.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white54.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white70),
                    hintText: '닉네임을 입력해주세요',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  onChanged: (value) {
                    newNickname = value;
                  },
                ),
              ),
              SizedBox(height: 20.0),
//
              SelectClay(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded SelectClay() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: <Widget>[
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  TabBar(
                      indicatorColor: Colors.yellow,
                      labelColor: Colors.black,
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(text: "클레이 색"),
                        Tab(
                          text: "배경 색",
                        ),
                        Tab(
                          text: "옷 색",
                        ),
                        Tab(
                          text: "표정",
                        )
                      ]),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: SizedBox(
                            height: 380,
                            child: TabBarView(
                              children: <Widget>[
                                FaceScreen(),
                                HairScreen(),
                                ClothesScreen(),
                                FaceScreen(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
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
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xfff6b1c3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(8),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffef788c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffff6191),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffde264c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff2b705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff29f05),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff28705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff27405),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffeff299),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffc1f258),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff7ebf3f),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff5d8c2e),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff06c7d0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0899da),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0f5dc2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff072bd9),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ],
    );
  }
}

class HairScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xfff6b1c3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(8),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffef788c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffff6191),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffde264c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff2b705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff29f05),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff28705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff27405),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffeff299),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffc1f258),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff7ebf3f),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff5d8c2e),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff06c7d0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0899da),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0f5dc2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff072bd9),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ],
    );
  }
}

class ClothesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xfff6b1c3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(8),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffef788c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffff6191),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffde264c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff2b705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff29f05),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff28705),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xfff27405),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffeff299),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffc1f258),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff7ebf3f),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff5d8c2e),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff06c7d0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0899da),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff0f5dc2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xff072bd9),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ],
    );
  }
}
