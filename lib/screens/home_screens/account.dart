import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy/services/authintication.dart';
import 'package:udemy/services/storge.dart';

import '../landing_page.dart';


class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  String finalName,finalEmail;

  @override
  void initState() {
    secureStorage.readSecureData('email').then((value){
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value){
      finalName = value;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed:(){})
        ],
        title: Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('oqbah ahmed',style: TextStyle(
                      color: Colors.white,fontSize: 24.0,
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top:50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(EvaIcons.google,color: Colors.white,),
                          Text('',style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                          ),),

                        ],
                      ),
                    ),
                    MaterialButton(onPressed: (){},
                      child: Text('Become an instructor',style: TextStyle(
                          color: Colors.lightBlue
                      ),),
                    )
                  ],
                ),
              ),
              Text('video prefer',style: TextStyle(
                color: Colors.grey
              ),),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('Download Option',style: TextStyle(
                  color: Colors.white,fontSize: 20
                ),),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('Video Playback Option',style: TextStyle(
                  color: Colors.white,fontSize: 20
                ),),
              ),
              Text('Account Setting',style: TextStyle(
                  color: Colors.grey
              ),),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('Account Security',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('Video Playback Option',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Row(
                  children: [
                  Text('Learning Reminders',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),Icon(EvaIcons.starOutline,color: Colors.white,)
                  ],
                ),
              ),
              Text('Support',style: TextStyle(
                  color: Colors.grey
              ),),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('About Udemy',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('About Udemy for business',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('FAQs',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              Text('Diagnostics',style: TextStyle(
                  color: Colors.grey
              ),),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                title: Text('Status',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),),
              ),
              Center(
                child: MaterialButton(
                  child: Text('Sign Out',style: TextStyle(
                    color: Colors.lightBlue,fontSize: 20
                  ),),
                  onPressed: ()async{
                    await authentication.googleSignOut().whenComplete((){
                      secureStorage.deleteSecureData('email');
                    }).whenComplete((){
                      Navigator.pushReplacement(context, PageTransition(
                          child:LandingPage(), type: PageTransitionType.bottomToTop));
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 155),
                child: Text('Version 1.2.1',style: TextStyle(
                    color: Colors.grey
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
