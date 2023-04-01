import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:event_app/Backend/backend.dart';
import 'package:event_app/Data/CityandStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Usefull/Colors.dart';
import '../Usefull/Buttons.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:http/http.dart' as http;

import '../Usefull/Functions.dart';






class userProfile extends StatefulWidget {
  Map data;
  userProfile({Key? key,required this.data}) : super(key: key);

  @override
  State<userProfile> createState() => _userProfileState();
}

final databaseRef = FirebaseDatabase.instance.reference();

class _userProfileState extends State<userProfile> {
  bool isHide = false;


  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  List<Widget> allInterests = [];


  @override
  void initState() {
    super.initState();
    for(var i in widget.data['cat']){
      var a = btnsss(i, () { }, mainColor, Colors.white);
      var s = SizedBox(width: 5.0,);

      setState(() {
        allInterests.add(a);
        allInterests.add(s);
      });
    }
  }




  late BuildContext mCtx;


  @override
  Widget build(BuildContext context) {

    mCtx = context;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(

                  children: [
                    Avatar(widget.data['index'], 40.0),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mainTextFAQS(widget.data['name'], textColor, 20.0, FontWeight.bold, 1),
                          mainTextFAQS(widget.data['city'], lightGrey, 10.0, FontWeight.normal, 1),
                        ],
                      ),
                    ),

                  ],
                ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Icon(Iconsax.message,color: mainColor,),
                      SizedBox(width: 10.0,),
                      mainTextFAQS(widget.data['email'], mainColor, 15.0, FontWeight.normal, 1),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  mainTextFAQS("My Interests", textColor, 15.0, FontWeight.normal, 1),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: allInterests,
                    ),
                  ),
                ]
              )),
        ),
        loaderss(isHide, context)
      ],
    );
  }




}


