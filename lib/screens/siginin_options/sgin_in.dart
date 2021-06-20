import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy/screens/home_screen.dart';
import 'package:udemy/screens/siginin_options/sign_up.dart';
import 'package:udemy/services/authintication.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              FlatButton.icon(
                  color: Colors.white,
                  onPressed: () async {
                    await authentication.googleSignIn();
                  },
                  icon: Icon(EvaIcons.email),
                  label: Text('Sign in with Email')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                     width: 180,
                      child: Divider(color: Colors.white,),
                    ),
                    SizedBox(width: 1.4,),
                    Text(
                      'or',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 1.4,),
                    SizedBox(
                      width: 180,
                      child: Divider(color: Colors.white,),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await authentication.googleSignIn().whenComplete((){
                        Navigator.pushReplacement(context,PageTransition
                          (child:HomeScreen(), type: PageTransitionType.rightToLeftWithFade));
                      });
                    },
                    icon: Icon(EvaIcons.google),
                    label: Text('Sign in with google')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(EvaIcons.facebook),
                    label: Text('Sign in with facebook')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.apple),
                    label: Text('Sign in with apple')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Row(
                  children: [
                    Text(
                      'New here?',
                      style: TextStyle(color: Colors.white),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: SignUp(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Text(
                        'create an account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/udemybg.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
