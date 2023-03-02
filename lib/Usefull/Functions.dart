import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
