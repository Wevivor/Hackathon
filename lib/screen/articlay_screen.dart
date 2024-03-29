import 'package:agile_hackathon/screen/arrange_screen.dart';
import 'package:agile_hackathon/screen/aticle_content_screen.dart';
import 'package:agile_hackathon/screen/share_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_home/draggable_home.dart';
import 'group_screen.dart';

final _firestore = FirebaseFirestore.instance;

// int _current = 0;
List imgList = [
  'https://cdn.loveandlemons.com/wp-content/uploads/2019/07/salad.jpg',
  'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  // 'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
];

final PageController ctrl = PageController();
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, height: 300, fit: BoxFit.cover),

//코로셀 위 글씨부분
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       ' ${imgList.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();

class Articlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DraggableHome(
        // backgroundColor: Colors.transparent,
        title: Text("Title"),
        headerWidget: headerWidget(context),
        headerExpandedHeight: 0.5,
        //        headerBottomBar: headerBottomBarWidget(),
        body: [
          BottomListview(),
        ],
        fullyStretchable: true,
      ),
    );
  }
}

Container headerWidget(BuildContext context) => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.4, 0.5, 0.75, 0.95, 1.0],
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
                        Center(child: ArticleScreen()), //화면이동 코드
                  ),
                );
              },
              icon: Icon(Icons.label),
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // SizedBox(height: 10.0),
            // CarouselSlider.builder(
            //   itemCount: 15,
            //   itemBuilder: (BuildContext context, int itemIndex,
            //           int pageViewIndex) =>
            //       Container(
            //           child: Text(itemIndex.toString()),
            //           ),
            //   options: CarouselOptions(
            //     height: 220.0,
            //     autoPlay: false,
            //     enlargeCenterPage: true,
            //     viewportFraction: 0.9,
            //     aspectRatio: 2.0,
            //     // aspectRatio: 16 / 9,
            //     // viewportFraction: 0.8,
            //     initialPage: 2,
            //   ),
            // ),
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: false,
                enlargeCenterPage: true,
                // viewportFraction: 0.9,
                // aspectRatio: .0,
                aspectRatio: 4 / 10,
                viewportFraction: 1, //화면채우기
                initialPage: 0,
              ),
              items: imageSliders,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );

class BottomListview extends StatefulWidget {
  @override
  _BottomListviewState createState() => _BottomListviewState();
}

class _BottomListviewState extends State<BottomListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommend",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                Icon(Icons.arrow_forward_ios_sharp),
              ],
            ),
          ),
          MessageStream(),
        ],
      ),
    );
  }
}

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
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  child: Image.asset(
                    'images/article1.png',
                    height: MediaQuery.of(context).size.height * (0.19),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  child: Image.asset(
                    'images/article2.png',
                    height: MediaQuery.of(context).size.height * (0.19),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  child: Image.asset(
                    'images/article3.png',
                    height: MediaQuery.of(context).size.height * (0.19),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
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
      margin: EdgeInsets.only(bottom: 5),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // 배경이 흐린 회색으로 바뀜.
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                child: Image.network(
                  image,
                  height: MediaQuery.of(context).size.height * (0.2),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
