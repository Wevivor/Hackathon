import 'package:agile_hackathon/screen/splash.dart';
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
        // brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
        primaryColorLight: Colors.white,
        // primaryColor: Colors.black,
      ),
      home: Splash(),
      // initialRoute: App.id,
      // routes: {
      //   App.id: (context) => App(),
      //   SocialLogin.id: (context) => SocialLogin(),
      //   MakeClay.id: (context) => MakeClay()
      // },
    );
  }
}
