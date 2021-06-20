import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy/screens/home_screens/account.dart';
import 'package:udemy/screens/home_screens/featured.dart';
import 'package:udemy/screens/home_screens/my_courses.dart';
import 'package:udemy/screens/home_screens/search.dart';
import 'package:udemy/screens/home_screens/wish_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  FirebaseMessaging _firebaseMessaging;
  String message;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });

        },
        controller: pageController,
        children: [Featured(), Search(), MyCourses(), WishList(), Account()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade900,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.red),
        iconSize: 25,
        selectedFontSize: 14.0,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(icon: Icon(EvaIcons.star), label: 'featured'),
          BottomNavigationBarItem(icon: Icon(EvaIcons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.video), label: 'my courses'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart), label: 'wish list'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
        ],
      ),
    );
  }
}
