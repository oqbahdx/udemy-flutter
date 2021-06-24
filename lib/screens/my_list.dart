import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy/screens/details/details_screen.dart';
import 'package:udemy/services/data_controller.dart';

class MyList extends StatefulWidget {


  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Container(
        child: GetBuilder<DataController>(
          init: DataController(),
          builder: (value){
            return FutureBuilder(
                future: value.getData('cart'),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
                  }else{
                    return ListView.builder(
                        shrinkWrap: true,

                        itemCount: snapshot.data.length,
                        itemBuilder:(BuildContext context,int index){
                          return Card(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 200,
                                      decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot.data[index].data()['image'],)
                                          )
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(snapshot.data[index].data()['author'],style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white
                                        ),),
                                        Row(
                                          children: [
                                            Text(snapshot.data[index].data()['rating'].toString(),style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                          ],
                                        ),
                                        Text("(${snapshot.data[index].data()['enrolled'].toString()}) student",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),),
                                        Text("\$${snapshot.data[index].data()['price'].toString()}",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                                Text(snapshot.data[index].data()['title'],style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)
                              ],
                            ),
                          );
                        });
                  }
                });
          },
        ),
      ),
    );
    // return SingleChildScrollView(
    //   child: Container(
    //     color: Colors.black,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: 400,
    //           width: 400,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               CircleAvatar(
    //                 child: Icon(EvaIcons.shakeOutline,color: Colors.white,
    //                 ),
    //                 radius: 50,
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 20,),
    //               child: Text('Want To Save Something Here Later',style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 24.0,
    //                 fontWeight: FontWeight.bold
    //               ),),
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 15),
    //                 child: Text('Your WishList Shell Go Here',style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 23.0,
    //                    // fontWeight: FontWeight.bold
    //                 ),),
    //               ),
    //
    //             ],
    //           ),
    //         ),
    //         Text('Browse Category',style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 22,
    //             color: Colors.white
    //         ),),
    //         ListTile(
    //           leading: Icon(EvaIcons.browserOutline,color: Colors.white,),
    //           title: Text('Fitness & Accounting',style: TextStyle(
    //             color: Colors.grey.shade700,
    //           ),),
    //         ),
    //         Divider(color: Colors.white,),
    //         ListTile(
    //           leading: Icon(EvaIcons.code,color: Colors.white,),
    //           title: Text('Development',style: TextStyle(
    //             color: Colors.grey.shade700,
    //           ),),
    //         ),
    //         Divider(color: Colors.white,),
    //         ListTile(
    //           leading: Icon(FontAwesomeIcons.businessTime,color: Colors.white,),
    //           title: Text('Business',style: TextStyle(
    //             color: Colors.grey.shade700,
    //           ),),
    //         ),
    //         Divider(color: Colors.white,),
    //         ListTile(
    //           leading: Icon(FontAwesomeIcons.vaadin,color: Colors.white,),
    //           title: Text('It & Software',style: TextStyle(
    //             color: Colors.grey.shade700,
    //           ),),
    //         ),
    //         Divider(color: Colors.white,),
    //         ListTile(
    //           leading: Icon(FontAwesomeIcons.microsoft,color: Colors.white,),
    //           title: Text('Office & Productivity',style: TextStyle(
    //             color: Colors.grey.shade700,
    //           ),),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
