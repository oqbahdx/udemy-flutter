import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy/screens/home_screen.dart';
import 'package:udemy/services/storge.dart';

import 'landing_page.dart';

class SplashScreen extends StatefulWidget {

  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  String finalName,finalEmail;
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value){
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value){
      finalName = value;
    });
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,PageTransition(
        child:finalName == null?LandingPage():HomeScreen(),

        type:PageTransitionType.rightToLeftWithFade )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/udemylogo.png',height: 250,width: 250,),
               Padding(padding: EdgeInsets.only(top: 50)),
              CircularProgressIndicator(
                backgroundColor: Colors.black,

              ),
            ],
          ),
        ),
      ),

    );
  }
}
