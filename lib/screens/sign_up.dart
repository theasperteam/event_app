import 'package:event_app/Usefull/Colors.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Usefull/Buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController usnameController = TextEditingController();
double screenh = 0;
double screenw = 0;
String email = "";
String fullname = " ";
String pass = "";
bool passwordVisible = true;
final formkey = GlobalKey<FormState>();

class _SignupState extends State<Signup> {
  @override
  void initState() {
    passwordVisible = !passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    screenh = MediaQuery.of(context).size.height;
    screenw = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bgColor,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
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
                            child: mainTextLeft("Sign up", Colors.white, 30,
                                FontWeight.w700, 1)),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: screenw / 24, color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          controller: usnameController,
                          key: ValueKey('fullname'),
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: 'mons',
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            labelText: "Enter Your Name",
                            labelStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            fillColor: mainColor,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter User name");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              fullname = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: screenw / 24, color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          controller: idController,
                          key: ValueKey('email'),
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
                              Icons.person,
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
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: screenw / 24, color: Colors.white),
                          ),
                        ),
                        TextFormField(

                          key: ValueKey('password'),
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
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            labelText: "Password",
                            counterText: "",
                            prefixIcon: Icon(
                              Icons.password,
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
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Password is too short';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: screenw / 1,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                AuthServices.signupUser(
                                    email, password, fullname, context);
                              }
                            },
                            child: mainText("Create", Colors.white, 18,
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
                            mainTextLeft("Already have a account ?",
                                Colors.white, 15, FontWeight.normal, 1),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signin()));
                                },
                                child: Text(
                                  "Sign in",
                                  style:
                                      TextStyle(color: mainColor, fontSize: 15),
                                ))
                          ],
                        ),
                      ]))),
        ));
  }
}

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': fullname});
  }
}

class AuthServices {
  static signupUser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signin()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You are Logged in')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}
