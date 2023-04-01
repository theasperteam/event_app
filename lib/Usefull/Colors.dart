

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/sign_in.dart';



Color mainColor = Color(0xFF4C7EFF);
Color secColor = Color(0xFF6991FF);
Color bgColor = Color(0xFF112454);
Color bgLight = Color(0xFF383838);

Color textColor = Color(0xFFFFFFFF);
Color textDark = Color(0xFF000D31);

Color lightGrey = Color(0xFFECECED);



Color errorColor = Color(0xFFFF0062);

Color transparent_overlay = Color(0xFFFFFF);

String mainFont = 'mons';
String mainFontLight = 'mons';

List allBanners = ['Assets/b/b1.jpg',
  'Assets/b/b2.jpg',
  'Assets/b/b3.jpg',
  'Assets/b/b4.jpg',
  'Assets/b/b5.jpg',
  'Assets/b/b6.jpg',];


AutoSizeText mainText(String text, Color c, double size, FontWeight w,int lines) {
  return AutoSizeText(
    text,
    textAlign: TextAlign.center,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,

    ),
  );
}



AutoSizeText mainTextFAQS(String text, Color c, double size, FontWeight w,int lines) {
  return AutoSizeText(
    text,
    textAlign: TextAlign.start,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,

    ),
  );
}


Text mainTextLeft(String text, Color c, double size, FontWeight w,int lines) {
  return Text(

    text,
    textAlign: TextAlign.start,
    maxLines: lines,
    softWrap: false,
    overflow: TextOverflow.fade,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFontLight,
      fontWeight: w,
    ),
  );
}

Text mainTextLight(String text, Color c, double size, FontWeight w,int lines) {
  return Text(

    text,
    textAlign: TextAlign.center,
    maxLines: lines,

    style: TextStyle(
        color: c,
        letterSpacing: 0.5,
        fontSize: size,
        fontFamily: mainFontLight,
        fontWeight: w,
        overflow: TextOverflow.ellipsis
    ),
  );
}


class loader extends StatelessWidget {
  const loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Container(
        height: 90.0,
        width: 90.0,
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: bgLight,
          elevation: 7.0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color: mainColor,
              strokeWidth: 5,
            ),
          ),
        ),
      ),
    );
  }
}


Widget loaderss(bool a,BuildContext context){
  return Visibility(
      visible: a,
      child: Stack(
        children: [
          Visibility(
            visible: a,
            child: new Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                color: transparent_overlay,
                elevation: 4.0,
              ),
            ),
          ),
          Visibility(visible: a, child: loader())
        ],
      ));
}

void Snacker(String title,GlobalKey<ScaffoldMessengerState> aa){
  final snackBar = SnackBar(
      elevation: 0,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: secColor,
      content:Text(title) );

  aa.currentState?.showSnackBar(snackBar);
  // messangerKey.currentState?.showSnackBar(snackBar);

}

Widget notFound(bool a,BuildContext context){
  return Visibility(
    visible: a,
      child: Center(
        child: Container(
    alignment: Alignment.center,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/notfound.png',width: 200.0,),
          mainText("Nothing Found", Colors.white, 10.0, FontWeight.normal, 1),
        ],
    ),
  ),
      ));
}

void snacker(String s, BuildContext c){
  ScaffoldMessenger.of(c).showSnackBar(SnackBar(
      elevation: 0,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: secColor,
      content:
  Text(s)));
}

toaster(String msg){
  Fluttertoast.showToast(msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: mainColor);
}

Widget banners(int index, String img, String file,double widht){
  if(file != ""){
    return Container(
      width: widht,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.file(File(file),
        fit: BoxFit.cover,),
      ),
    );
  }
  else if(img != ""){
    return Container(
      width: widht,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(img,
        fit: BoxFit.cover,),
      ),
    );
  }
  else{
    return Container(
      width: widht,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(allBanners[index],
        fit: BoxFit.cover,),
      ),
    );
  }
}

List allAvatars = [
"Assets/avatars/1.jpg",
"Assets/avatars/2.jpg",
"Assets/avatars/3.jpg",
"Assets/avatars/4.jpg",
"Assets/avatars/5.jpg",
"Assets/avatars/6.jpg",
"Assets/avatars/7.jpg",
"Assets/avatars/8.jpg",
"Assets/avatars/9.jpg",
"Assets/avatars/10.jpg",
"Assets/avatars/11.jpg",
"Assets/avatars/13.jpg",
"Assets/avatars/14.jpg",
];

Widget Avatar(int index, double radius){
  return CircleAvatar(
    radius: radius,
    child: ClipOval(
      child: Image.asset(allAvatars[index],fit: BoxFit.cover,),
    ),
  );
}


