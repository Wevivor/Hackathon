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
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.yellow,
                    isScrollable: true, //가로스크롤 허용
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: '전체보기',
                      ),
                      Tab(
                        text: '창업모음',
                      ),
                      Tab(
                        text: '요리백과',
                      ),
                      Tab(
                        text: '여행에미치다',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 550,
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
                  // SizedBox(height: 200, child: BottomBar.)
                ],
              ),
            ),
          ],
        ));
  }
}

//전체 콘텐츠 불러오기
class AllContents extends StatefulWidget {
  @override
  _AllContentsState createState() => _AllContentsState();
}

class _AllContentsState extends State<AllContents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (5 / 8),
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                border: Border.all(color: Colors.black12, width: 3)), //테두리
          ),
        ],
      ),
    );
  }
}
