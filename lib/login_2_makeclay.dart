import 'package:agile_hackathon/screen/login_screen.dart';
import 'package:agile_hackathon/screen/makeclay_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginNext extends StatelessWidget {
  static String id = "login_2_makeclay";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //false면 로그인페이지로
            return SocialLogin();
          } else
            return MakeClay();
        },
      ),
    );
  }
}
