import 'package:agile_hackathon/screen/share_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_home/draggable_home.dart';

final _firestore = FirebaseFirestore.instance;

int _current = 0;
List imgList = [
  'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
];

class Articlay extends StatelessWidget {
  final PageController ctrl = PageController();
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, height: 300, fit: BoxFit.cover),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.05, 0.2, 0.25, 0.4, 0.5, 1.0],
          colors: [
            Color(0xFF000000),
            Color(0xFF0E0E0E),
            Color(0xFF5C5C5C),
            Color(0xFFADADAD),
            Color(0xFFD8D8D8),
            Colors.white
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            '아티클레이',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true, //타이틀 중앙배열
          // elevation: 0.0, //앱바하단 경계선 제거
          actions: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  //push속성 : 다음화면으로 이동 -새로운 화면이 표시되어도 이전 화면은 메모리에 남게 됨.
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Center(child: ShareScreen()), //화면이동 코드
                  ),
                );
              },
              icon: Icon(Icons.settings),
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  SizedBox(
                    height: 300,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 300.0,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                      ),
                      items: imageSliders,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                "Recommend",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      MessageStream(),
                    ],
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

class recommendBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        title: Text("Title"),
        headerWidget: headerWidget(context),
        body: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommend",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
              MessageStream(),
            ],
          ),
        ]);
  }
}

Container headerWidget(BuildContext context) => Container(
      child: Center(
        child: Column(
          children: [
            //프로필
            SafeArea(
              child: Column(
                children: <Widget>[
                  Text(
                    '닉네임은 뭐하지',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.yellow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('user1').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              //child: LoadingOverlay(isLoading: true, opacity: 0.2),
              );
        }
        final contents = snapshot.data!.docs;
        List<ContentsBubble> contentsBubbles = [];
        for (var content in contents) {
          final contentTitle = content['title'];
          final contentDescription = content['description'];
          final contentImage = content['image'];
          final contentURL = content['url'];
          final contentTime = content['time'];
          final contentsBubble = ContentsBubble(
            title: contentTitle,
            description: contentDescription,
            image: contentImage,
            url: contentURL,
          );

          contentsBubbles.add(contentsBubble);
        }
        return SizedBox(
          height: 300,
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: contentsBubbles,
          ),
        );
      },
    );
  }
}

class ContentsBubble extends StatelessWidget {
  ContentsBubble(
      {required this.title,
      required this.description,
      required this.image,
      required this.url});

  final String title;
  final String description;
  final String image;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // 배경이 흐린 회색으로 바뀜.
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 15.0, left: 10, right: 10, bottom: 10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
//              SizedBox(
//                height: MediaQuery.of(context).size.height * (0.3),
//                child: Image.network(image, fit: BoxFit.cover),
//              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                child: Image.network(
                  image,
                  height: MediaQuery.of(context).size.height * (0.3),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
