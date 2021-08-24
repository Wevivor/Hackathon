import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CLAY',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true, //타이틀 중앙배열
        elevation: 0.0, //앱바 하단 그림자 선효과 제거
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('사진업로드...'), Text('링크 가져오기...')],
        ),
      ),
    );
  }
}
