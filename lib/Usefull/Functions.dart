import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:event_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/post.dart';

navScreen(Widget a, BuildContext context, bool replace) {
  if (replace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return a;
    }));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return a;
    }));
  }
}

bottoms(BuildContext ctx, Widget w) {
  showBarModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Container(
          // height: 200.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: w,
        );
      });
}

void insertData(
    String city,
    String event_id,
    String desc,
    String title,
    String duration,
    String venue,
    String seats,
    String price,
    String date,
    String mode,
    String name,
    String time,
    String category) {
  Map<String, dynamic> Item = {
    'id': event_id,
    'desc': desc,
    'title': title,
    'duration': duration,
    'mode': mode,
    'venue': venue,
    'price': price,
    'date': date,
    'time': time,
    'seats': seats,
    'city': city,
    'user': name,
    'category': category
  };
  User? user = FirebaseAuth.instance.currentUser;
  print(user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? uid = user?.uid;

  databaseRef.child("event").child(event_id).set(Item);
  databaseRef.child("city").child(city).child(event_id).set(Item);
  databaseRef.child("user").child(uid!).child(event_id).set(Item);
  databaseRef.child("category").child(category).child(event_id).set(Item);

  desc_controller.clear();
  title_controller.clear();
  dur_controller.clear();
  venue_controller.clear();
  price_controller.clear();
  seat_controller.clear();
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
