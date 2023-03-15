import 'package:event_app/screens/sign_in.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Colors.dart';

double borderRadius = 10.0;

class btnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  btnsss(this.title, this.callback, this.main, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // child: Padding(
      //   padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: mainText(title, text, 13.0, FontWeight.normal, 1),
      // ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
    );
  }
}

class borderbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color text;

  borderbtnsss(this.title, this.callback, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: mainText(title, text, 13.0, FontWeight.normal, 1),
      ),
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(transparent_overlay),
          backgroundColor:
              MaterialStateProperty.all<Color>(transparent_overlay),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: text, width: 2.0)))),
      onPressed: callback,
    );
  }
}

class fullbtnsss extends StatelessWidget {
    VoidCallback callback;
    String title;
    Color main;
    Color text;

  fullbtnsss(this.title, this.callback, this.main, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: [
            Spacer(),
            mainText(title, text, 18.0, FontWeight.normal, 1),
            Spacer()
          ],
        ),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
    );
  }
}

class borderfullbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color text;

  borderfullbtnsss(this.title, this.callback, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: [
            Spacer(),
            mainText(title, text, 13.0, FontWeight.normal, 1),
            Spacer()
          ],
        ),
      ),
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(transparent_overlay),
          backgroundColor:
              MaterialStateProperty.all<Color>(transparent_overlay),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: transparent_overlay)))),
      onPressed: callback,
    );
  }
}

class Gbutton extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  Gbutton(this.title, this.callback,this.main, this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: screenw/1,
      child: ElevatedButton.icon(
          onPressed: () {},
          icon: ImageIcon(AssetImage("Assets/images/google.png"),color: Colors.black,),
          label: mainText(
              "Continue with Google", Colors.white, 15, FontWeight.normal, 1), style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),),
    );
  }
}
