import 'package:agile_hackathon/widget/bottombar.dart';
import 'package:agile_hackathon/widget/search.dart';
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
        resizeToAvoidBottomInset: false,
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
            Search(),
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: SizedBox(
                height: 500,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.yellow,
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: '전체보기',
                        ),
                        Tab(
                          text: '카테고리',
                        ),
                        Tab(
                          text: '카테고리',
                        ),
                        Tab(
                          text: '카테고리',
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 900,
                        child: TabBarView(
                          children: <Widget>[
                            AllContents(),
                            AllContents(),
                            AllContents(),
                            AllContents(),
                          ], //카테고리 각버튼별 화면
                        ),
                      ),
                    ),
                    // SizedBox(height: 2, child: BottomBar())
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

//전체 콘텐츠 불러오기
class AllContents extends StatefulWidget {
  const AllContents({Key? key}) : super(key: key);

  @override
  _AllContentsState createState() => _AllContentsState();
}

class _AllContentsState extends State<AllContents> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'images/pink.jpg',
          //   width: 100,
          //   height: 300,
          // ),
        ]);
  }
}
