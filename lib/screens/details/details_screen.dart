import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy/services/vidoes.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                Get.arguments['title'],
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Text(
                Get.arguments['description'],
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                EvaIcons.star,
                                color: Colors.white,
                              ),
                              Text(
                                Get.arguments['rating'].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                EvaIcons.star,
                                color: Colors.white,
                              ),
                              Text(
                                "${Get.arguments['enrolled']} student",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              EvaIcons.star,
                              color: Colors.white,
                            ),
                            Text(
                              "${Get.arguments['hour'].toString()} total hours",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 30,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "the author is : ${Get.arguments['author']}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(Container(
                      child: VideoDisplay(
                        videoUrl: Get.arguments['video'],
                      ),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 220,
                      width: 400,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(Get.arguments['image']),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black54, BlendMode.darken)),
                              ),
                            ),
                            Positioned(
                                top: 50,
                                left: 150,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 80,
                                )),
                            Positioned(
                              top: 170,
                              right: 60,
                              child: Text(
                                'Preview this course',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection('cart')
                              .add({
                            'title': Get.arguments['title'],
                            'price': Get.arguments['price'],
                            'author': Get.arguments['author'],
                            'tag': Get.arguments['tag'],
                            'image': Get.arguments['image'],
                            'enrolled': Get.arguments['enrolled'],
                            'rating': Get.arguments['rating'],
                          }).whenComplete(() {
                            Get.snackbar(
                                "Udemy", "${Get.arguments['title']} add to Cart",
                                colorText: Colors.black,
                                snackPosition: SnackPosition.BOTTOM);
                          });
                        },
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection('wishList')
                              .add({
                            'title': Get.arguments['title'],
                            'price': Get.arguments['price'],
                            'author': Get.arguments['author'],
                            'tag': Get.arguments['tag'],
                            'image': Get.arguments['image'],
                            'enrolled': Get.arguments['enrolled'],
                            'rating': Get.arguments['rating'],
                          }).whenComplete(() {
                            Get.snackbar("Udemy",
                                "${Get.arguments['title']} add to WishList",
                                colorText: Colors.black,
                                snackPosition: SnackPosition.BOTTOM,
                                );
                          });
                        },
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Add To WishList',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
