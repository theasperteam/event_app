

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/sign_in.dart';



Color mainColor = Color(0xFFF59779);
Color secColor = Color(0xFFFF774C);
Color bgColor = Color(0xFF0C0C0D);
Color bgLight = Color(0xFF383838);

Color transparent_overlay = Color(0xFFFFFF);

String mainFont = 'mons';
String mainFontLight = 'mons';


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
Widget reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return
    Container(width:screenw/1,height: screenh/18,
      child: TextField(


      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.black,
      style: TextStyle(
          color: Colors.black, fontSize: 17),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: mainColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
  ),
    );
}
Widget fieldTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    child: Text(
      title,
      style: TextStyle(
        fontSize: screenw / 24,
        color: Colors.white

      ),
    ),
  );
}

