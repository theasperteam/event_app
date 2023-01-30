import 'package:event_app/Usefull/Buttons.dart';
import 'package:event_app/Usefull/Colors.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
double screenh = 0;
double screenw = 0;

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    screenh = MediaQuery.of(context).size.height;
    screenw = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenh / 7,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: mainTextLeft(
                        "Sign in", Colors.white, 30, FontWeight.w700, 1)),
                SizedBox(height: 70),
                fieldTitle("Email"),
                reusableTextField(
                    "Enter your Email", Icons.person, false, idController),
                SizedBox(height: 30),
                fieldTitle("Password"),
                reusableTextField(
                    "Enter Password", Icons.password, true, passController),
                SizedBox(
                  height: 50,
                ),
                fullbtnsss("Login", () {}, secColor, Colors.white),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 15,
                  indent: 50,
                  endIndent: 50,
                ),
                Gbutton("Continue with Google", () {}, secColor, Colors.white),
                // fullbtnsss("Continue with Google", () {}, secColor, Colors.white),
                Row(
                  children: [
                    SizedBox(width: screenw / 6),
                    mainTextLeft("Don't have a account ?", Colors.white, 15,
                        FontWeight.normal, 1),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Signup",
                          style: TextStyle(color: mainColor, fontSize: 15),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
