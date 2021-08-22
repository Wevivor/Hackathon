import 'package:agile_hackathon/login_2_makeclay.dart';
import 'package:agile_hackathon/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//firebase 초기화
class App extends StatelessWidget {
  static String id = "app";
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Firebase core loads fail"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return LoginNext();
          }

          return CircularProgressIndicator();
        });
  }
}
