
import 'dart:io';

import 'package:event_app/Usefull/Colors.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import 'nav_screen/about_us.dart';
import 'nav_screen/contact_us.dart';
import 'nav_screen/invite.dart';
import 'nav_screen/privacy_policy.dart';
import 'nav_screen/settings.dart';




class navigationDrawer extends StatefulWidget {
  Map<dynamic,dynamic> allData;
  navigationDrawer({Key? key, required this.allData})
      : super(key: key);

  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {




  @override

  void onAboutUs() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AboutUs()));
  }
  void onContactUs() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ContactUs()));
  }
  void onPrivacyPolicy() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
  }
  void onInvite() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Invite()));
  }
  void onSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Settings()));
  }
  void initState() {
    super.initState();
    if(widget.allData['photo'] != null){
      setState((){
        // circleImage = Image.network(widget.allData['photo'],
        // fit: BoxFit.cover);
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      child: Column(
        children: [
          buildHeder(context,widget.allData),
          buildMenu(context),
        ],
      ),
    );
  }

  Widget buildHeder(BuildContext context,Map data) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: mainColor
      ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                mainText("Avent", Colors.white, 20.0, FontWeight.normal, 1),
                const Spacer(),
              ],
            ),
            

          ],
        )
    );
  }

  Widget buildMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          color: mainColor,
          height: 0.4,
          child: Row(
            children: [
              const Spacer()
            ],
          ),
        ),
        const SizedBox(height: 10.0,),

        ListTile(
          leading: const Icon(Iconsax.info_circle),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("About Us", Colors.white, 13.0, FontWeight.normal, 1),
          onTap:onAboutUs,
        ),

        ListTile(
          leading: const Icon(Iconsax.call),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("Contact", Colors.white, 13.0, FontWeight.normal, 1),
          onTap:onContactUs,
        ),

        ListTile(
          leading: const Icon(Iconsax.shield),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("Privacy Policy", Colors.white, 13.0, FontWeight.normal, 1),
          onTap: onPrivacyPolicy,
        ),

        ListTile(
          leading: const Icon(Iconsax.user_cirlce_add),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("Invite", Colors.white, 13.0, FontWeight.normal, 1),
          onTap:onInvite,
        ),

        ListTile(
          leading: const Icon(Iconsax.setting),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("Settings", Colors.white, 13.0, FontWeight.normal, 1),
          onTap:onSettings,
        ),

        ListTile(
          leading: const Icon(Iconsax.logout),
          iconColor: Colors.white,
          visualDensity: const VisualDensity(vertical: -3),
          focusColor: bgColor,
          selectedTileColor: bgColor,
          selectedColor: bgColor,
          title:
          mainTextLeft("Logout", Colors.white, 13.0, FontWeight.normal, 1),
          onTap: () {

          },
        ),



        SizedBox(height: 100.0,),





      ],
    );
  }

}

// Future <List<String>> fetchUrl() async{
//   final response = await http.get("https://gefgkerg.com" as Uri);
//
// }
