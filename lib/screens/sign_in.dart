import 'package:event_app/Backend/backend.dart';
import 'package:event_app/Usefull/Buttons.dart';
import 'package:event_app/Usefull/Colors.dart';
import 'package:event_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
double screenh = 0;
double screenw = 0;
String email = "";
String password = "";
bool isHide = false;
final formkey = GlobalKey<FormState>();
FirebaseAuth _auth = FirebaseAuth.instance;
final _messangerKey = GlobalKey<ScaffoldMessengerState>();

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    screenh = MediaQuery.of(context).size.height;
    screenw = MediaQuery.of(context).size.width;
    AlertDialog alert = AlertDialog(
      title: Text("Sign in Failed!"),
      content: Text("Wrong email or password."),
      actions: [],
    );
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: screenh / 7,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: mainTextLeft("Sign in", Colors.white, 30,
                                FontWeight.w700, 1)),
                        SizedBox(height: 70),
                        fieldTitle("Email"),
                        TextFormField(
                          controller: idController,
                          maxLength: 36,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: 'mons',
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "Enter Your Email",
                            counterText: "",
                            prefixIcon: Icon(
                              Iconsax.user,
                              color: Colors.black,
                            ),
                            fillColor: mainColor,
                            filled: true,
                            hintStyle:
                                TextStyle(fontFamily: 'mons', color: secColor),
                            labelStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                          ),
                          onChanged: (text) {
                            email = text;
                          },
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (!emailValid) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        fieldTitle("Password"),
                        TextFormField(
                          maxLength: 18,
                          cursorColor: Colors.black,
                          controller: passController,
                          obscureText: !passwordVisible,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                            fontFamily: 'mons',
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Iconsax.eye
                                    : Iconsax.eye_slash,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            labelText: "Enter your Password",
                            counterText: "",
                            prefixIcon: Icon(
                              Iconsax.key,
                              color: Colors.black,
                            ),
                            fillColor: mainColor,
                            filled: true,
                            hintStyle:
                                TextStyle(fontFamily: 'mons', color: secColor),
                            labelStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                          ),
                          onChanged: (text) {
                            password = text;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter a password");
                            } else if (value.length < 6) {
                              return ("The Password length must be more than 6 characters");
                            }
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: screenw / 1,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              login(context);
                            },
                            child: mainText("Login", Colors.white, 18,
                                FontWeight.normal, 1),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(secColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(secColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(borderRadius),
                                        side: BorderSide(color: secColor)))),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          height: 15,
                          indent: 50,
                          endIndent: 50,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: screenw / 1,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage("Assets/images/google.png"),
                              color: Colors.black,
                            ),
                            label: mainText("Continue with Google",
                                Colors.white, 15, FontWeight.normal, 1),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(secColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(secColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(borderRadius),
                                        side: BorderSide(color: secColor)))),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: screenw / 6),
                            mainTextLeft("Don't have a account ?", Colors.white,
                                15, FontWeight.normal, 1),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                                child: Text(
                                  "Sign up",
                                  style:
                                      TextStyle(color: mainColor, fontSize: 15),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              loaderss(isHide, context)
            ],
          )),
    );
  }

  login(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isHide = true;
      });
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  checker(context),
                  print('ho gya'),
                  setState(() {
                  }),
                });
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          setState(() {
            isHide = false;
          });
          Snacker("User not Found", _messangerKey);
        } else if (e.code == "wrong_password") {
          setState(() {
            isHide = false;
          });
          Snacker("Wrong Password", _messangerKey);
          print('hello');
        } else {
          setState(() {
            isHide = false;
          });
          Snacker("Something went wrong", _messangerKey);
          print('hello');
        }
      }
    }
  }
}
