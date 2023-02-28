import 'package:event_app/Homes/HomeScreen.dart';
import 'package:event_app/Usefull/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


checker(BuildContext c) async {
  User? user = await FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('user')
      .where("uid", isEqualTo: user!.uid)
      .get();

  if (querySnapshot != null) {
    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    if (allData.length != 0) {
      var b = allData[0] as Map<String, dynamic>;
      Navigator.of(c).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (c) => homeScreen(
                    data: b,
                  )),
          (Route<dynamic> route) => false);
      // if(b['index'] != null) {
      //   Navigator.of(c).pushAndRemoveUntil(
      //       MaterialPageRoute(builder: (c) =>
      //           homeScreen(data: b,)), (Route<dynamic> route) => false);
      // }
      // else{
      //
      // }
    }
  }
}
