import 'package:event_app/Usefull/Colors.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController usnameController= TextEditingController();
double screenh = 0;
double screenw = 0;

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    screenh = MediaQuery.of(context).size.height;
    screenw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenh / 7,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: mainTextLeft(
                      "Sign up", Colors.white, 30, FontWeight.w700, 1)),


              fieldTitle("User Name"),
              reusableTextField(
                  "Enter User Name", Icons.person, false, usnameController),
              SizedBox(height: 30),
              fieldTitle("Email"),
              reusableTextField(
                  "Enter your Email", Icons.person, false, idController),
              SizedBox(height: 30),
              fieldTitle("Password"),
              reusableTextField(
                  "Enter Password", Icons.password, true, passController),
              SizedBox(height: 30),
              fieldTitle("Confirm Password"),
              reusableTextField("Re-enter your Password", Icons.password, false,
                  passController)
            ],
          ),
        ),
      ),
    );
  }
}
