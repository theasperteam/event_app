import 'package:event_app/NavDrawer/nav_screen/about_us.dart';
import 'package:event_app/NavDrawer/nav_screen/contact_us.dart';
import 'package:event_app/NavDrawer/nav_screen/invite.dart';
import 'package:event_app/NavDrawer/nav_screen/privacy_policy.dart';
import 'package:event_app/NavDrawer/nav_screen/settings.dart';
import 'package:flutter/material.dart';

import '../Usefull/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class navdrawer extends StatefulWidget {
  const navdrawer({Key? key}) : super(key: key);

  @override
  State<navdrawer> createState() => _navdrawerState();
}

class _navdrawerState extends State<navdrawer> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String username = "";
  String id = "";
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  void fetchDatabaseList() async {
    final user = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();
    setState(() {
      username = userDoc.get('name');
      id = userDoc.get('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            child: ListView(padding: EdgeInsets.all(0), children: [
      UserAccountsDrawerHeader(
        accountName: Text(username,
            style: TextStyle(
                fontFamily: "Aboreto",
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        accountEmail: Text(id),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
              child: Image.asset(
            "Assets/images/sample.jpg",
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          )),
        ),
        decoration: BoxDecoration(
          color: secColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => setting()));
        }),
      ),
      Divider(
        color: secColor,
      ),
      ListTile(
        leading: Icon(Icons.share),
        title: Text(
          "Invite",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Invite()));
        }),
      ),
      Divider(
        color: secColor,
      ),
      ListTile(
        leading: Icon(Icons.info),
        title: Text(
          "AboutUs",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUs()));
        }),
      ),
      ListTile(
        leading: Icon(Icons.contact_emergency),
        title: Text(
          "ContactUs",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactUs()));
        }),
      ),
      Divider(
        color: secColor,
      ),
      ListTile(
        leading: Icon(Icons.privacy_tip),
        title: Text(
          "Privacy Policies",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()));
        }),
      ),
      Divider(
        color: secColor,
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text(
          "Log Out",
          style: TextStyle(fontSize: 16),
        ),
        iconColor: Colors.black,
        onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()));
        }),
      ),
    ])));
  }
}
