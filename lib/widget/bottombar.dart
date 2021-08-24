// import 'package:flutter/cupertino.dart';
import 'package:agile_hackathon/screen/chat_screen.dart';
import 'package:agile_hackathon/screen/group_screen.dart';
import 'package:agile_hackathon/screen/share_screen.dart';
import 'package:agile_hackathon/screen/articlay_screen.dart';
import 'package:agile_hackathon/screen/mypage_screen.dart';
import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            //화면에 들어갈 부분
            children: [
              Articlay(),
              GroupScreen(),
              ShareScreen(),
              ChatScreen(),
              MyCategory(), //마이페이지
            ],
          ),
          //네비게이션 바

          bottomNavigationBar: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label, //글씨 사이즈만큼 이동bar길이
              indicatorColor: Colors.yellow,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.black38, //선택안된 탭 텍스트색
              labelStyle: TextStyle(
                fontSize: 10,
              ),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  text: '아티클레이',
                ),
                Tab(
                  icon: Icon(
                    Icons.group,
                    color: Colors.black,
                  ),
                  text: '그룹',
                ),
                Tab(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  text: 'ADD',
                ),
                Tab(
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.black,
                  ),
                  text: '채팅',
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  text: 'mypage',
                )
              ]),
        ),
      ),
    );
  }

  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: bottomsheet로',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: mypage',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Center(
//       //   child: _widgetOptions.elementAt(_selectedIndex),
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: '아티클레이',
//             backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.plus_one),
//             label: '추가',
//             backgroundColor: Colors.green,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: '마이페이지',
//             backgroundColor: Colors.purple,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
