import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy/screens/home_screen.dart';

class MyList extends StatefulWidget {
  const MyList({Key key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     PageTransition(
        //         child: HomeScreen(), type: PageTransitionType.topToBottom);
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        title: Text('My List'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
