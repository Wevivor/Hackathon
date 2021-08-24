import 'package:agile_hackathon/makeclay_data.dart';
import 'package:agile_hackathon/widget/bottombar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                        backgroundColor: Colors.black,
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
                borderRadius: BorderRadius.circular(15.0),
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
                    hintText: '닉네임을 입력해주세요.',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
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
                        Tab(text: "클레이색"),
                        Tab(
                          text: "배경색",
                        ),
                        Tab(
                          text: "옷",
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
                                FaceScreen(),
                                FaceScreen(),
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

//하단 클레이 커스텀 화면
//class SelectClay extends StatefulWidget {
//  @override
//  _SelectClayState createState() => _SelectClayState();
//}
//
//class _SelectClayState extends State<SelectClay>
//    with SingleTickerProviderStateMixin {
//  late TabController _tabController;
//
//  @override
//  void initState() {
//    super.initState();
//    _tabController =
//        TabController(length: list.length, vsync: this); // initialise it here
//  }
//
//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }
//
//  List<Widget> list = [
//    Tab(icon: Icon(Icons.android)),
//    Tab(icon: Icon(Icons.add_shopping_cart)),
//    Tab(icon: Icon(Icons.card_giftcard)),
//    Tab(icon: Icon(Icons.phone_android)),
//  ];
//
//  textStyle() {
//    return TextStyle(color: Colors.black, fontSize: 20.0);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      appBar: AppBar(
////        bottom: TabBar(
////          controller: _tabController,
////          isScrollable: true,
////          tabs: list,
////          indicator: UnderlineTabIndicator(
////              borderSide: BorderSide(width: 2.0, color: Colors.white),
////              insets: EdgeInsets.symmetric(horizontal: 0.0)),
////
//////        /  indicatorPadding: EdgeInsets.all(0.0),
////          indicatorWeight: 4.0,
////          labelPadding: EdgeInsets.only(left: 30.0, right: 30.0),
////        ),
////      ),
////      body: TabBarView(
////        controller: _tabController,
////        children: [
////          Center(
////              child: Text(
////            'Cake',
////            style: textStyle(),
////          )),
////          Center(
////              child: Text(
////            'Cart',
////            style: textStyle(),
////          )),
////          Center(
////              child: Text(
////            'GiftCard',
////            style: textStyle(),
////          )),
////          Center(
////              child: Text(
////            'Phone',
////            style: textStyle(),
////          )),
////        ],
////      ),
//        body: DefaultTabController(
//            length: 3,
//            child: Scaffold(
//              appBar: AppBar(
//                backgroundColor: Colors.redAccent,
//                bottom: TabBar(
//                    labelColor: Colors.redAccent,
//                    unselectedLabelColor: Colors.white,
//                    indicatorSize: TabBarIndicatorSize.label,
//                    indicator: BoxDecoration(
//                        borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(10),
//                            topRight: Radius.circular(10)),
//                        color: Colors.white),
//                    tabs: [
//                      Tab(
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text("APPS"),
//                        ),
//                      ),
//                      Tab(
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text("MOVIES"),
//                        ),
//                      ),
//                      Tab(
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text("GAMES"),
//                        ),
//                      ),
//                    ]),
//              ),
//              body: TabBarView(children: [
//                Icon(Icons.apps),
//                Icon(Icons.movie),
//                Icon(Icons.games),
//              ]),
//            )));
////    Container(
////      color: Colors.white,
////      child: Container(
////        padding: EdgeInsets.all(20.0),
////        decoration: BoxDecoration(
////          color: Colors.white,
////          borderRadius: BorderRadius.only(
////            topLeft: Radius.circular(20.0),
////            topRight: Radius.circular(20.0),
////          ),
////        ),
////      ),
////    );
//  }
//}

//커스텀버튼 누르면 나올 하단 커스텀 창
class FaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFFFFFFF),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
//
//class HairScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Color(0xFFFFFFFF),
//      child: Container(
//        padding: EdgeInsets.all(20.0),
//        decoration: BoxDecoration(
//          color: Colors.black,
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(20.0),
//            topRight: Radius.circular(20.0),
//          ),
//        ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          // mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//            SelectButton(),
//            SizedBox(height: 50),
//            //커스텀 창
//            Container(
//              color: Colors.black,
//              child: Image.asset(
//                'images/cha.png',
//                height: 100,
//              ),
//              // decoration: BoxDecoration(
//              //     border: Border.all(color: Colors.black, width: 10)),
//            ),
//            SizedBox(height: 150),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
////
////클레이 커스텀 선택 버튼: 클레이색,헤어,표정,상의색,배경색 버튼
//class SelectButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 30,
//      child: ListView(
//        scrollDirection: Axis.horizontal,
//        children: [
//          ButtonTheme(
//            minWidth: 20, //버튼의 최소 가로 길이
//            height: 10, //버튼의 세로 길이
//            shape: RoundedRectangleBorder(
//                //버튼을 둥글게 처리
//                borderRadius: BorderRadius.circular(40)),
//            child: ElevatedButton(
//              //ButtonTheme의 child로 버튼 위젯 삽입
//              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all(Colors.lime),
//                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                  RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    //side: BorderSide(color: Colors.lime)   // border line color
//                  ),
//                ),
//              ),
//              onPressed: () {
//                FaceScreen();
//              },
//              child: Text(
//                '클레이색',
//                style:
//                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//              ),
//            ),
//          ),
//          SizedBox(
//            width: 10,
//          ),
//          ButtonTheme(
//            minWidth: 20, //버튼의 최소 가로 길이
//            height: 10, //버튼의 세로 길이
//            shape: RoundedRectangleBorder(
//                //버튼을 둥글게 처리
//                borderRadius: BorderRadius.circular(40)),
//            child: ElevatedButton(
//              //ButtonTheme의 child로 버튼 위젯 삽입
//              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all(Colors.lime),
//                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                  RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    //side: BorderSide(color: Colors.lime)   // border line color
//                  ),
//                ),
//              ),
//              onPressed: () {
//                HairScreen();
//              },
//              child: Text(
//                '헤어 스타일',
//                style:
//                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//              ),
//            ),
//          ),
//          SizedBox(
//            width: 10,
//          ),
//          ButtonTheme(
//            minWidth: 20, //버튼의 최소 가로 길이
//            height: 10, //버튼의 세로 길이
//            shape: RoundedRectangleBorder(
//                //버튼을 둥글게 처리
//                borderRadius: BorderRadius.circular(40)),
//            child: ElevatedButton(
//              //ButtonTheme의 child로 버튼 위젯 삽입
//              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all(Colors.lime),
//                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                  RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    //side: BorderSide(color: Colors.lime)   // border line color
//                  ),
//                ),
//              ),
//              onPressed: () {},
//              child: Text(
//                '표정',
//                style:
//                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//              ),
//            ),
//          ),
//          SizedBox(
//            width: 10,
//          ),
////상의 색 버튼
//          ButtonTheme(
//            minWidth: 20, //버튼의 최소 가로 길이
//            height: 10, //버튼의 세로 길이
//            shape: RoundedRectangleBorder(
//                //버튼을 둥글게 처리
//                borderRadius: BorderRadius.circular(40)),
//            child: ElevatedButton(
//              //ButtonTheme의 child로 버튼 위젯 삽입
//              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all(Colors.lime),
//                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                  RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    //side: BorderSide(color: Colors.lime)   // border line color
//                  ),
//                ),
//              ),
//              onPressed: () {},
//              child: Text(
//                '상의 색',
//                style:
//                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//              ),
//            ),
//          ),
//          SizedBox(
//            width: 10,
//          ),
////배경색 버튼
//          ButtonTheme(
//            minWidth: 20, //버튼의 최소 가로 길이
//            height: 10, //버튼의 세로 길이
//            shape: RoundedRectangleBorder(
//                //버튼을 둥글게 처리
//                borderRadius: BorderRadius.circular(40)),
//            child: ElevatedButton(
//              //ButtonTheme의 child로 버튼 위젯 삽입
//              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all(Colors.lime),
//                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                  RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    //side: BorderSide(color: Colors.lime)   // border line color
//                  ),
//                ),
//              ),
//              onPressed: () {},
//              child: Text(
//                '배경색',
//                style:
//                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
