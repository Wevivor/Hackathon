import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = " ";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white, //검색창 배경
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xF6FFFFFF), //검색창 안쪽 배경
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      //커서가 있을때 X버튼 띄우고, 아니라면 빈상태로 보여주기
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              }),
                      hintText: 'Search',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelStyle: TextStyle(color: Colors.black),
                      // border: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.transparent),
                      //     borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          // Using Wrap makes the bottom sheet height the height of the content.
                          // Otherwise, the height will be half the height of the screen.
                          return Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('날짜별'),
                              ),
                              ListTile(
                                leading: Icon(Icons.link),
                                title: Text('형식별'),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('색깔별'),
                              ),
                            ],
                          );
                        },
                      ); //정렬기준
                    },
                    icon: Icon(Icons.filter_alt_rounded))
              ],
            ),
          ),
          // _buildBody(context)
        ],
      ),
    );
  }
}
