import 'package:flutter/material.dart';

import '../makeclay_data.dart';

class MyPage extends StatelessWidget {
  late final Clay nickname;

  MyPage({required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
      ),
    );
  }
}

// class MyPage extends StatefulWidget {
//   late final Clay nickname;

//   MyPage({required this.nickname});
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text('마이페이지'));
//   }
// }
