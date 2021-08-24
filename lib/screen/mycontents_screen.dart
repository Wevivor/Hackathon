import 'package:flutter/material.dart';

class MyContents extends StatefulWidget {
  // const MyContents({Key? key}) : super(key: key);

  @override
  _MyContentsState createState() => _MyContentsState();
}

class _MyContentsState extends State<MyContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '내 콘텐츠',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
      body: Center(child: Text('콘텐츠 정렬')),
    );
  }
}
