

import 'package:event_app/Usefull/Colors.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/screens/sign_in.dart';
import 'package:event_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: StreamBuilder
      (stream: FirebaseAuth.instance.authStateChanges(),builder: (context,snapshot){
        if(snapshot.hasData){
          return Home();
        }else {
          return Signin();
        }




    })
  ));
}


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                mainText("Avent", bgColor, 30.0, FontWeight.bold, 1),
                Spacer(),

              ],
            ),
            mainText("ASPER", bgLight, 10.0, FontWeight.normal, 1),
          ],
        ),
      ),
    );
  }
}


