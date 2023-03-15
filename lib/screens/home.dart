import 'package:event_app/Usefull/Colors.dart';
import 'package:event_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => Signin())));
        },
      )),
    );
  }
}
