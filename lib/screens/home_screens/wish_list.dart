import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishList extends StatefulWidget {
  const WishList({Key key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(EvaIcons.shakeOutline,color: Colors.white,
                    ),
                    radius: 50,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20,),
                  child: Text('Want To Save Something Here Later',style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15),
                    child: Text('Your WishList Shell Go Here',style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                       // fontWeight: FontWeight.bold
                    ),),
                  ),

                ],
              ),
            ),
            Text('Browse Category',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white
            ),),
            ListTile(
              leading: Icon(EvaIcons.browserOutline,color: Colors.white,),
              title: Text('Fitness & Accounting',style: TextStyle(
                color: Colors.grey.shade700,
              ),),
            ),
            Divider(color: Colors.white,),
            ListTile(
              leading: Icon(EvaIcons.code,color: Colors.white,),
              title: Text('Development',style: TextStyle(
                color: Colors.grey.shade700,
              ),),
            ),
            Divider(color: Colors.white,),
            ListTile(
              leading: Icon(FontAwesomeIcons.businessTime,color: Colors.white,),
              title: Text('Business',style: TextStyle(
                color: Colors.grey.shade700,
              ),),
            ),
            Divider(color: Colors.white,),
            ListTile(
              leading: Icon(FontAwesomeIcons.vaadin,color: Colors.white,),
              title: Text('It & Software',style: TextStyle(
                color: Colors.grey.shade700,
              ),),
            ),
            Divider(color: Colors.white,),
            ListTile(
              leading: Icon(FontAwesomeIcons.microsoft,color: Colors.white,),
              title: Text('Office & Productivity',style: TextStyle(
                color: Colors.grey.shade700,
              ),),
            ),
           
          ],
        ),
      ),
    );
  }
}
