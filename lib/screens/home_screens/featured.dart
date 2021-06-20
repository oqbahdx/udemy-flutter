import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy/screens/details/details_screen.dart';
import 'package:udemy/screens/my_list.dart';
import 'package:udemy/services/data_controller.dart';

class Featured extends StatefulWidget {
  const Featured({Key key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined), onPressed: () {
                  Get.to(MyList());
            }),
          ],
          title: Text('Featured'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/udemysale1.png')),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 400,
                  color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Courses for sale now',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Recommended for you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('featured'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else {
                          return new ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                Get.to(DetailScreen(),
                                transition: Transition.leftToRightWithFade,
                                  arguments: snapshot.data[index],
                                );
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data()['image']),
                                                fit: BoxFit.contain)
                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0,left: 8.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 200
                                          ),
                                          child: Text(snapshot.data[index].data()['title'],style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),),

                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(snapshot.data[index].data()['author'],style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.black54
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Row(
                                          children: [
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Text("(${snapshot.data[index].data()['rating']})",style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54
                                            ),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("(${snapshot.data[index].data()['enrolled']}) students",style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("\$${snapshot.data[index].data()['price'].toString()}",style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Best Seller',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('top'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else {
                          return new ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Get.to(DetailScreen(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: snapshot.data[index],
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .data()['image']),
                                                fit: BoxFit.contain)
                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0,left: 8.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 200
                                          ),
                                          child: Text(snapshot.data[index].data()['title'],style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),),

                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(snapshot.data[index].data()['author'],style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Row(
                                          children: [
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Icon(EvaIcons.star,color: Colors.yellow,),
                                            Text("(${snapshot.data[index].data()['rating']})",style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54
                                            ),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("(${snapshot.data[index].data()['enrolled']}) students",style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("\$${snapshot.data[index].data()['price'].toString()}",style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
