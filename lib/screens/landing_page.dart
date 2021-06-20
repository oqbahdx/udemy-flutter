import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy/screens/siginin_options/sgin_in.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Image.asset(
              'assets/udemybg.png',
              fit: BoxFit.fitHeight,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text(
                'browse',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 20),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, PageTransition(child: SignIn(), type: PageTransitionType.bottomToTop));
              },
              child: Text(
                'sign in',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
