import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('정렬기준'),
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
                  // ListTile(
                  //   leading: Icon(Icons.delete),
                  //   title: Text('카테고리별'),
                  // ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
