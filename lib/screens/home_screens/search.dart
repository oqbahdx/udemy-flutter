import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Search'),

        backgroundColor: Colors.black,
       actions: [
         IconButton(icon: Icon(EvaIcons.search), onPressed:(){})
       ],
      ),
    );
  }
}
