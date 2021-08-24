import 'package:agile_hackathon/makeclay_data.dart';
import 'package:agile_hackathon/widget/bottombar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  static String id = "chat_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          '채팅',
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
              SizedBox(height: 10.0),
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
                            "추천 사용자",
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
                    height: MediaQuery.of(context).size.height * (0.75),
                    child: ListView(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'images/pink.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text('Pink_prince'),
                            subtitle: Text('세상에서 가장 아름다운 것은 핑크다.'),
                            trailing: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
