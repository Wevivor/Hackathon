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
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                color: Colors.black,
              )
            ],
            title: Text(
              '내 콘텐츠',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )),
        body: Column(
          children: <Widget>[
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.yellow,
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: '내 카테고리',
                        ),
                        Tab(
                          text: '내 클레이',
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 10000,
                        child: TabBarView(
                          children: <Widget>[
                            allContents(),
                            allContents(),
                          ], //카테고리 각버튼별 화면
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

//전체 콘텐츠 불러오기
Container allContents() {
  return Container(
    child: Image.asset('images/cha.png'),
  );
}
