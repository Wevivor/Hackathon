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
          'CLAY  ZONE',
          style: TextStyle(color: Colors.white, fontSize: 15),
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
                backgroundImage: AssetImage('images/clay/moza4.png'),
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
                  Text('콘텐츠 수:  13')
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
              // MyClayScreen()
            ],
          ),
        ),
      ),
    );
  }
}

///////////내카테고리 리스트////////////////////
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
      headerExpandedHeight: 0.38, //헤드 height
      body: [
        BottomListview(),
        // listView(),
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

////////프로필//////////
Container headerWidget(BuildContext context) => Container(
      child: Center(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/clay/moza4.png'),
                    ),
                  ),
                  Text(
                    '닉네임은 뭐하지',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFFFD82A)),
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
                        '콘텐츠 수:  13',
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

//중앙 탭바
class BottomListview extends StatefulWidget {
  @override
  _BottomListviewState createState() => _BottomListviewState();
}

class _BottomListviewState extends State<BottomListview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SizedBox(
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.yellow,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: '내 카테고리',
                ),
                Tab(
                  text: '내 클레이',
                ),
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 10000,
                child: TabBarView(
                  children: <Widget>[MyCategoryScreen(), MyClayScreen()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////// 프로필 하단 my카테고리화면//////////
class MyCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        childAspectRatio: (50 / 30),
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text('전체보기'),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                          color: Color(0x63585858)) // border line color
                      ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFF000000))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text(
              '창업모음',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(
                    //     color: Color(0x33585858)) // border line color
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFD82A))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text(
              '요리백과',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(
                    //     color: Color(0x33585858)) // border line color
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFD82A))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text(
              '여행에미치다',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(
                    //     color: Color(0x33585858)) // border line color
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text(
              '맛집모음',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(
                    //     color: Color(0x33585858)) // border line color
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return MyContents();
              }));
            },
            child: Text(
              '영화',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    // side: BorderSide(
                    //     color: Color(0x33585858)) // border line color
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFEB3B))),
          ),
        ],
      ),
    );
  }
}

////하단 내 클레이 모음 화면
class MyClayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Image.asset(
            'images/clay/moza4.png',
          ),
          Image.asset(
            'images/pink.jpg',
          ),
          Image.asset(
            'images/blue.JPG',
          ),
          Image.asset(
            'images/puple.JPG',
          ),
        ],
      ),
    );
  }
}
