import 'package:agile_hackathon/widget/bottombar.dart';
import 'package:agile_hackathon/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _firestore = FirebaseFirestore.instance;

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
                          ALLContents(),
                          StartupContents(),
                          CookContents(),
                          TripContents(),
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

class ALLContents extends StatefulWidget {
  @override
  _ALLContentsState createState() => _ALLContentsState();
}

class _ALLContentsState extends State<ALLContents> {
  var result;

  @override
  void initState() {
//    result = _firestore
//        .collection('${FirebaseAuth.instance.currentUser!.uid}')
//        .doc("userContents")
//        .collection("userContents")
//        .where("category", isEqualTo: "창업모음");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (6 / 8),
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/1.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/4.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/3.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/3.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/2.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/6.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/1.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/7.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/2.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/5.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/4.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/5.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/6.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//전체 콘텐츠 불러오기
class StartupContents extends StatefulWidget {
  @override
  _StartupContentsState createState() => _StartupContentsState();
}

class _StartupContentsState extends State<StartupContents> {
  var result;

  @override
  void initState() {
//    result = _firestore
//        .collection('${FirebaseAuth.instance.currentUser!.uid}')
//        .doc("userContents")
//        .collection("userContents")
//        .where("category", isEqualTo: "창업모음");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (6 / 8),
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/1.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/2.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/3.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/4.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/5.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/6.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/startup/7.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CookContents extends StatefulWidget {
  @override
  _CookContentsState createState() => _CookContentsState();
}

class _CookContentsState extends State<CookContents> {
  var result;

  @override
  void initState() {
//    result = _firestore
//        .collection('${FirebaseAuth.instance.currentUser!.uid}')
//        .doc("userContents")
//        .collection("userContents")
//        .where("category", isEqualTo: "창업모음");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (6 / 8),
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/6.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/2.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/3.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/4.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/5.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/1.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/cook/7.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripContents extends StatefulWidget {
  @override
  _TripContentsState createState() => _TripContentsState();
}

class _TripContentsState extends State<TripContents> {
  var result;

  @override
  void initState() {
//    result = _firestore
//        .collection('${FirebaseAuth.instance.currentUser!.uid}')
//        .doc("userContents")
//        .collection("userContents")
//        .where("category", isEqualTo: "창업모음");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (6 / 8),
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/1.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/2.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/3.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/4.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/5.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/6.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      "images/trip/7.jpg",
                      height: MediaQuery.of(context).size.height * (0.28),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
