import 'package:event_app/NavDrawer/NavDrawer.dart';
import 'package:event_app/screens/Profile.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Usefull/Colors.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

class homeScreen extends StatefulWidget {
  Map data;
  homeScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  bool isHide = false;
  int _index = 0;
  List bottomItems = [];

  @override
  void initState() {
    // testApi();
    setState(() {
      bottomItems = [
   Home(),
        Column(),
        PostScreen(),
        userProfile(data: widget.data)
       // profile(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: bgColor,
      drawer: navigationDrawer(allData: widget.data,),
      appBar: AppBar(
        backgroundColor: transparent_overlay,
        elevation: 0.0,
        leading: Row(
          children: [
            SizedBox(),
            IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: Icon(Iconsax.menu_1))
          ],
        ),
        centerTitle: true,
        title: Row(
          children: [
            // Icon(Iconsax.car),
            SizedBox(
              width: 3.0,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
        child: CustomNavigationBar(
          borderRadius: Radius.circular(10.0),
          elevation: 10.0,
          isFloating: true,
          currentIndex: _index,
          backgroundColor: mainColor,
          unSelectedColor: bgColor,
          selectedColor: Colors.white,
          iconSize: 25.0,
          onTap: (i) {
            setState(() {
              _index = i;

              if (_index == 2) {
                isHide = true;
              }
            });
          },
          items: [
            CustomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                ),),
                // title:
                //     mainText("Home", Colors.white, 10.0, FontWeight.normal, 1)),
            CustomNavigationBarItem(
                icon: Icon(
                  Iconsax.box,
                ),),
                // title: mainText(
                //     "Children", Colors.white, 10.0, FontWeight.normal, 1)),
            CustomNavigationBarItem(
                icon: Icon(
                  Iconsax.add_circle,
                ),),
                // title:
                //     mainText("Post", Colors.white, 10.0, FontWeight.normal, 1)),
            CustomNavigationBarItem(
                icon: Icon(
                  Iconsax.user,
                ),),
                // title: mainText(
                //     "Profile", Colors.white, 10.0, FontWeight.normal, 1)),
          ],
        ),
      ),
      body: bottomItems.elementAt(_index),
    );
  }
}
