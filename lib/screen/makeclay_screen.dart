import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MakeClay extends StatelessWidget {
  static String id = "makeclay_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '나만의 클레이 캐릭터 생성하기',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                '${FirebaseAuth.instance.currentUser!.displayName}님만의 클레이 캐릭터를 만들어 보세요!'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: FirebaseAuth.instance.signOut,
            )
          ],
        ),
      ),
    );
  }
}
