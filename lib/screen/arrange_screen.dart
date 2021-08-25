import 'package:agile_hackathon/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

final _firestore = FirebaseFirestore.instance;

class ArrangeScreen extends StatefulWidget {
  // const MyContents({Key? key}) : super(key: key);

  @override
  _ArrangeScreenState createState() => _ArrangeScreenState();
}

class _ArrangeScreenState extends State<ArrangeScreen> {
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
                          ALLContents(),
                          ALLContents(),
                          ALLContents(),
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          iter("https://youtu.be/TjVP4cICwGE"),
          iter2(),
          iter3(),
        ],
      ),
    );
  }
}

class iter extends StatefulWidget {
  final url;
  iter(this.url);
  @override
  _iterState createState() => _iterState("https://youtu.be/TjVP4cICwGE");
}

class _iterState extends State<iter> {
  var _url;
  final _key = UniqueKey();
  _iterState(this._url);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Video",
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
        Container(
          child: Row(
            children: [
              RawMaterialButton(
                padding: const EdgeInsets.only(left: 18, right: 3),
                onPressed: () {
                  WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: _url);
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Image.asset("images/startup/2.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/cook/1.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/startup/3.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
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
                        width: MediaQuery.of(context).size.width * (0.22),
                        height: MediaQuery.of(context).size.height * (0.12),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class iter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Text",
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
        Container(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/startup/1.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/cook/2.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/startup/5.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
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
                        width: MediaQuery.of(context).size.width * (0.22),
                        height: MediaQuery.of(context).size.height * (0.12),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class iter3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Image",
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
        Container(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/startup/4.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/cook/5.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/startup/6.jpg",
                          width: MediaQuery.of(context).size.width * (0.22),
                          height: MediaQuery.of(context).size.height * (0.12),
                          fit: BoxFit.cover,
                        ),
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
                        width: MediaQuery.of(context).size.width * (0.22),
                        height: MediaQuery.of(context).size.height * (0.12),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
