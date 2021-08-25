import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GroupScreen extends StatelessWidget {
  static String id = "group_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'GROUP',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true, //타이틀 중앙배열
        // elevation: 0.0, //앱바하단 경계선 제거
        backgroundColor: Colors.white,
      ),
//화면부분
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
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
                        '님 관심있는 주제의 그룹에 참여해보세요!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //완성된 캐릭터
              SizedBox(height: 17.0),
              SizedBox(
                  child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "추천 그룹",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * (0.68),
                      child: FaceScreen()),
                ],
              ))
            ],
          ),
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
      childAspectRatio: (50 / 27),
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      children: <Widget>[
        groupContainer(image: 'images/group1.png'),
        groupContainer(image: 'images/group2.png'),
        groupContainer(image: 'images/group3.png'),
      ],
    );
  }
}

class groupContainer extends StatelessWidget {
  const groupContainer({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              child: Image.asset(
                image,
                height: MediaQuery.of(context).size.height * (0.24),
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
