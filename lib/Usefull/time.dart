import 'package:event_app/Usefull/Buttons.dart';
import 'package:event_app/Usefull/Colors.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TimeOfDay? time;

  String getText() {
    if (time == null) {
      return "Select Time";
    } else {
      print('${time?.hour}');
      return "${time?.hour}:${time?.minute}  ${time?.period.name}";
    }
  }

  @override
  Widget build(BuildContext context) =>
      borderbtnsss(getText(), () => pickTime(context), secColor);

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
    });
  }
}
