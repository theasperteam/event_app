import 'dart:math';
import 'package:event_app/Usefull/date.dart';
import 'package:event_app/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Backend/helper.dart';
import '../Usefull/Colors.dart';
import '../Usefull/Buttons.dart';
import '../Usefull/Functions.dart';
import '../Usefull/time.dart';
// import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

double screenh = 0;
double screenw = 0;
bool isHide = false;
String? desc;
String? title;
String? ven_ue;

TextEditingController desc_controller = TextEditingController();
TextEditingController title_controller = TextEditingController();
TextEditingController dur_controller = TextEditingController();
TextEditingController venue_controller = TextEditingController();
TextEditingController seat_controller = TextEditingController();
TextEditingController price_controller = TextEditingController();

final databaseRef = FirebaseDatabase.instance.reference();

class _PostScreenState extends State<PostScreen> {
  String event_date = "Select date";
  DateTime? date;
  String event_time = "Select time";
  TimeOfDay? time;
  String selectedCategory = "Online";
  String selectedCategory1 = "Seminar";
  int index = 0;

  String _text = "";
  String _mail = "";

  @override
  void initState() {
    super.initState();

    HelperFunctions.getuserNameSharePreference().then((value) {
      setState(() {
        _text = value.toString();
      });
    });

    HelperFunctions.getuserEmailSharePreference().then((value) {
      setState(() {
        _mail = value.toString();
      });
    });
  }

  String getText() {
    if (date == null) {
      return 'Select date';
    } else {
      return "${date?.month}/${date?.day}/${date?.year}";
    }
  }

  List<String> categoryList = ['Offline', 'Online'];
  List<String> categoryList1 = [
    'Hackathon',
    'Seminar',
    'Workshops',
    'Cultural'
  ];

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (int i = 0; i < categoryList.length; i++) {
      String cat = categoryList[i];
      var newItem = DropdownMenuItem(
        child: Text(cat),
        value: cat,
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  List<DropdownMenuItem<String>> getDropDownItems1() {
    List<DropdownMenuItem<String>> dropDownItems1 = [];

    for (int i = 0; i < categoryList1.length; i++) {
      String cat = categoryList1[i];
      var newItem = DropdownMenuItem(
        child: Text(cat),
        value: cat,
      );
      dropDownItems1.add(newItem);
    }
    return dropDownItems1;
  }

  @override
  Widget build(BuildContext context) {
    screenh = MediaQuery.of(context).size.height;
    screenw = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: mainTextLeft("Post Event", secColor, 30,
                                  FontWeight.w700, 1)),
                          Expanded(child: Container()),
                          borderbtnsss('Post', () {
                            if (desc_controller.text.isNotEmpty &&
                                title_controller.text.isNotEmpty &&
                                price_controller.text.isNotEmpty &&
                                ((selectedCategory == "Offline" &&
                                        venue_controller.text.isNotEmpty) ||
                                    selectedCategory == "Online") &&
                                seat_controller.text.isNotEmpty &&
                                dur_controller.text.isNotEmpty &&
                                event_date != "Select date" &&
                                event_time != "Select time") {
                              insertData(
                                  'Bhopal',
                                  generateRandomString(10),
                                  desc_controller.text,
                                  title_controller.text,
                                  dur_controller.text,
                                  venue_controller.text,
                                  seat_controller.text,
                                  price_controller.text,
                                  event_date.toString(),
                                  selectedCategory,
                                  _text,
                                  event_time.toString(),
                                  selectedCategory1);
                              event_date = "Select date";
                              event_time = "Select time";
                              selectedCategory1 = "Seminar";
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: bgColor,
                                  content: Text(
                                    "Please fill all the details",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  duration: Duration(seconds: 2),

                                  width: 280.0, // Width of the SnackBar.
                                  padding: const EdgeInsets.all(10),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              );
                            }
                          }, secColor)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: desc_controller,
                        key: ValueKey('description'),
                        maxLines: 4,
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: "What is the event all about?"),
                        onSaved: (value) {
                          setState(() {
                            desc = value!;
                          });
                          print(desc);
                        },
                      ),
                    ])),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width,
            color: bgLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return simpleDialogBox();
                            });
                      },
                      child: mainTextLeft(
                          "Schedule", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.title_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return titleDialogBox("Title of the event",
                                  title_controller, "title");
                            });
                      },
                      child: mainTextLeft(
                          "Title", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.title_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return titleDialogBox(
                                  "Total seats", seat_controller, "seats");
                            });
                      },
                      child: mainTextLeft(
                          " Total Seats", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.title_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return titleDialogBox("Price per ticket",
                                  price_controller, "price");
                            });
                      },
                      child: mainTextLeft(
                          "Price", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.title_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return durationDialogBox();
                            });
                      },
                      child: mainTextLeft(
                          "Duration", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.title_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return locationDialogBox();
                            });
                      },
                      child: mainTextLeft(
                          "Location", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return catDialogBox();
                            });
                      },
                      child: mainTextLeft(
                          "Category", mainColor, 15, FontWeight.w400, 1),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    // loaderss(isHide, context)
  }

  Widget simpleDialogBox() {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          height: 250,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date and Time',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Date :'),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    borderbtnsss(event_date, () async {
                      final initialDate = DateTime.now();
                      final newDate = await showDatePicker(
                        context: context,
                        initialDate: date ?? initialDate,
                        firstDate: DateTime(DateTime.now().year - 5),
                        lastDate: DateTime(DateTime.now().year + 5),
                      );

                      if (newDate == null) return;

                      setState(() {
                        date = newDate;
                        event_date = DateFormat('MM/dd/yyyy').format(date!);
                        // super.setState(() {});
                      });
                    }, secColor)
                  ],
                );
              }),
              SizedBox(
                height: 10,
              ),
              Text('Time: '),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    borderbtnsss(event_time, () async {
                      final initialTime = TimeOfDay(hour: 9, minute: 0);
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: time ?? initialTime,
                      );

                      if (newTime == null) return;

                      setState(() {
                        time = newTime;
                        event_time =
                            "${time?.hour}:${time?.minute}  ${time?.period.name}";
                      });
                    }, secColor)
                  ],
                );
              }),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      if ((event_date == "Select date") ||
                          (event_time == "Select time")) {
                        String text;
                        if ((event_date == "Select date") &&
                            (event_time == "Select time")) {
                          text = "Please select date and time";
                        } else if ((event_date == "Select date")) {
                          text = "Please select date";
                        } else {
                          text = "Please select time";
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: bgColor,
                            content: Text(
                              text,
                              style: TextStyle(color: Colors.white),
                            ),
                            duration: Duration(seconds: 2),

                            width: 280.0, // Width of the SnackBar.
                            padding: const EdgeInsets.all(10),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        );
                      } else {
                        // var players = fire
                        Navigator.pop(context);
                      }

                      print(event_time.isEmpty);
                      print(event_date);
                    },
                    child: mainText("ok", mainColor, 15, FontWeight.w400, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleDialogBox(
      String txt, TextEditingController controller, String key) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          height: 130,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17, color: secColor),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller,
                key: ValueKey('${key}'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        mainText("cancel", mainColor, 15, FontWeight.w400, 1),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      String txt = controller.text;
                      if (txt == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: bgColor,
                            content: Text(
                              "Please enter the ${key}",
                              style: TextStyle(color: Colors.white),
                            ),
                            duration: Duration(seconds: 2),

                            width: 280.0, // Width of the SnackBar.
                            padding: const EdgeInsets.all(10),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }

                      print(txt);
                      print(event_date);
                    },
                    child: mainText("ok", mainColor, 15, FontWeight.w400, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget durationDialogBox() {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          height: 130,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duration ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: secColor),
              ),
              TextFormField(
                controller: dur_controller,
                key: ValueKey('duration'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        mainText("cancel", mainColor, 15, FontWeight.w400, 1),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      String txt = dur_controller.text;
                      if (txt == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: bgColor,
                            content: Text(
                              "Please enter the duration",
                              style: TextStyle(color: Colors.white),
                            ),
                            duration: Duration(seconds: 2),

                            width: 280.0, // Width of the SnackBar.
                            padding: const EdgeInsets.all(10),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        );
                      } else {
                        // databaseRef.child("path").set
                        Navigator.pop(context);
                      }

                      print(txt);
                      print(event_date);
                    },
                    child: mainText("ok", mainColor, 15, FontWeight.w400, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationDialogBox() {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Dialog(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                height: isHide ? 230 : 130,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mode',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: secColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      menuMaxHeight: 350,
                      dropdownColor: Colors.grey,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      value: selectedCategory,
                      items: getDropDownItems(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value as String;
                          if (selectedCategory == "Offline") {
                            isHide = true;
                          } else {
                            isHide = false;
                          }
                          for (int i = 0; i < categoryList.length; i++) {
                            if (selectedCategory == categoryList[i]) {
                              index = i;
                            }
                          }
                        });

                        print(isHide);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    venue(isHide),
                    SizedBox(
                      height: isHide ? 40 : 5,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: mainText(
                              "cancel", mainColor, 15, FontWeight.w400, 1),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            print(event_date);
                          },
                          child:
                              mainText("ok", mainColor, 15, FontWeight.w400, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              )));
    });
  }

  Widget catDialogBox() {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Dialog(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                height: 130,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: secColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      menuMaxHeight: 350,
                      dropdownColor: Colors.grey,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      value: selectedCategory1,
                      items: getDropDownItems1(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory1 = value as String;
                          for (int i = 0; i < categoryList1.length; i++) {
                            if (selectedCategory1 == categoryList1[i]) {
                              index = i;
                            }
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: mainText(
                              "cancel", mainColor, 15, FontWeight.w400, 1),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            print(event_date);
                          },
                          child:
                              mainText("ok", mainColor, 15, FontWeight.w400, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              )));
    });
  }

  Widget venue(bool a) {
    return Visibility(
        visible: a,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Venue',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: secColor),
            ),
            TextFormField(
              controller: venue_controller,
              key: ValueKey('Venue'),
            ),
          ],
        ));
  }
}
