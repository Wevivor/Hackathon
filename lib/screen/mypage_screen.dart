import 'package:agile_hackathon/screen/mycontents_screen.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  // late final Clay nickname;
  // MyProfile({required this.nickname});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black), //앱바 버튼색
        title: Text(
          '마이페이지',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true, //타이틀 중앙배열
        elevation: 0.0, //앱바 하단 그림자 선효과 제거
        backgroundColor: Colors.black,
      ),
//body
//그라데이션 배경
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF000000),
              Color(0xFF222222),
              Color(0xFF5E5D5D),
              Color(0xFF979797),
              Color(0xFFC0BFBF),
              Color(0xFFCFCECE),
              Color(0xFFD8D8D8),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              //프로필
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/cha.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '닉네임은 뭐하지',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('아티클 수:  0'),
                  SizedBox(width: 50),
                  Text('콘텐츠 수:  9')
                ],
              ),
              // SizedBox(
              //   height: 30,
              // ),
              //하단 경계선
              // Padding(
              //   padding: EdgeInsets.only(left: 10, right: 10),
              //   child: Divider(
              //     thickness: 1,
              //     color: Colors.black,
              //   ),
              // ),
              // MyCategory()
            ],
          ),
        ),
      ),
    );
  }
}

///////////내콘텐츠 리스트////////////////////

class MyCategory extends StatelessWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // leading: Icon(Icons.arrow_back_ios),  //< 뒤로가기버튼 형태
      title: Text("마이 프로필"), //닉네임 이름 전달 받아서 띄우기
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        listView(), //콘텐츠리스트로 변경
      ],
      fullyStretchable: true,
      expandedBody: MyProfile(),
    );
  }

//설정 아이콘 버튼
  Container headerBottomBarWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
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
                  SizedBox(
                    width: 150,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/cha.png'),
                    ),
                  ),
                  Text(
                    '닉네임은 뭐하지',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.yellow),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '아티클 수:  0',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '콘텐츠 수:  9',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

ListView listView() {
  return ListView(
    padding: EdgeInsets.only(top: 0),
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: <Widget>[
      SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: Text('전체보기'), style: ButtonStyle()),
              InkWell(
                child: Image.asset('images/pink.jpg', width: 120, height: 120),
                onTap: () => MyContents(),
              ),
            ],
          ),
        ],
      ))
    ],
  );
}




// ListView listView() {
//     return ListView.builder(
//     padding: EdgeInsets.only(top: 0),
//     physics: NeverScrollableScrollPhysics(),
//     itemCount: 9,
//     shrinkWrap: true,
//     itemBuilder: (context, index) => Card(
//       color: Colors.white70,
//       child: ListTile(
//         leading: CircleAvatar(
//           child: Text("$index"),
//         ),
//         title: Text("카테고리"),
//         subtitle: Text("Subtitile"),
//       ),
//     ),
//   );
// }
