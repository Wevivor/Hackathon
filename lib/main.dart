import 'package:agile_hackathon/app.dart';
import 'package:agile_hackathon/screen/login_screen.dart';
import 'package:agile_hackathon/screen/makeclay_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //네이티브 연결시 binding필수
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLAY CLAY',
      theme: ThemeData(
        primaryColorLight: Colors.white10,
      ),
      home: App(),
      // initialRoute: App.id,
      // routes: {
      //   App.id: (context) => App(),
      //   SocialLogin.id: (context) => SocialLogin(),
      //   MakeClay.id: (context) => MakeClay()
      // },
    );
  }
}
