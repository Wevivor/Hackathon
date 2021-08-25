import 'package:flutter/material.dart';
import 'dart:async';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:filter_list/filter_list.dart';

final _firestore = FirebaseFirestore.instance;

class ShareScreen extends StatefulWidget {
  static String id = "share_screen";
  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  late StreamSubscription _intentDataStreamSubscription;
  String? _sharedText;
  var data;

  List<String> urls = [
    'https://flyer.chat',
  ];
  String newTitle = "";
  String newDescription = "";

  @override
  void initState() {
    super.initState();

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      setState(
        () async {
          _sharedText = value;
          debugPrint('sharelink');
          urls.add(_sharedText!);
          for (String url in urls) {
            debugPrint(url);
          }
          data = await MetadataFetch.extract(urls[urls.length - 1]);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  color: Color(0xff757575), // 배경이 흐린 회색으로 바뀜.
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data?.url,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        TextFormField(
                          initialValue: data?.title,
                          maxLines: 2,
                          //overflow: TextOverflow.ellipsis,
                          onChanged: (value) {
                            newTitle = value;
                          },
                        ),
                        TextFormField(
                          initialValue: data?.description,
                          maxLines: 2,
                          //overflow: TextOverflow.ellipsis,
                          onChanged: (value) {
                            newDescription = value;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * (0.3),
                          child:
                              Image.network(data?.image, fit: BoxFit.fitWidth),
                        ),
                        FlatButton(
                          onPressed: () {
                            _firestore
                                .collection(
                                    '${FirebaseAuth.instance.currentUser!.uid}')
                                .doc("userContents")
                                .collection("userContents")
                                .add({
                              'url': data?.url,
                              'description': newDescription != ""
                                  ? newDescription
                                  : data?.description,
                              'title': newTitle != "" ? newTitle : data?.title,
                              'image': data?.image,
                              'time': DateTime.now()
                            });

//                            _firestore.collection('user1').add({
//                              'url': data?.url,
//                              'description': newDescription != ""
//                                  ? newDescription
//                                  : data?.description,
//                              'title': newTitle != "" ? newTitle : data?.title,
//                              'image': data?.image,
//                              'time': DateTime.now()
//                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    ReceiveSharingIntent.getInitialText().then((String? value) {
      setState(() {
        _sharedText = value;
        debugPrint('sharelink');
        for (String url in urls) {
          debugPrint(url);
        }
      });
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CLAY',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true, //타이틀 중앙배열
          elevation: 0.0, //앱바 하단 그림자 선효과 제거
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MessageStream()],
        ),
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
              time: contentTime);

          contentsBubbles.add(contentsBubble);
        }
        return Expanded(
          child: ListView(
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
      required this.time,
      required this.url});

  final String title;
  final String description;
  final String image;
  final String url;
  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757575), // 배경이 흐린 회색으로 바뀜.
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                url,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (0.3),
                child: Image.network(image, fit: BoxFit.fitWidth),
              ),
            ],
          ),
        ),
      ),
    );
//    Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: [
//          Text(
//            sender,
//            style: TextStyle(fontSize: 12.0, color: Colors.black54),
//          ),
//          Material(
//            borderRadius: BorderRadius.circular(30.0),
//            elevation: 5.0, //drop shadow 그림자
//            color: Colors.lightBlueAccent,
//            child: Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//              child: Text(
//                text,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 15.0,
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}
