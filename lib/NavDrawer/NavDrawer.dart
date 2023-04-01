
import 'dart:io';

import 'package:event_app/NavDrawer/nav_screen/about_us.dart';
import 'package:event_app/NavDrawer/nav_screen/contact_us.dart';
import 'package:event_app/NavDrawer/nav_screen/invite.dart';
import 'package:event_app/NavDrawer/nav_screen/privacy_policy.dart';
import 'package:event_app/NavDrawer/nav_screen/settings.dart';
import 'package:event_app/Usefull/Colors.dart';
import 'package:event_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Usefull/Functions.dart';




class navigationDrawer extends StatefulWidget {
  Map allData;
  navigationDrawer({Key? key, required this.allData})
      : super(key: key);

  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: Column(
        children: [
          buildHeder(context,widget.allData),
          buildMenu(context),
        ],
      ),
    );
  }

  Widget buildHeder(BuildContext context,Map data) {

    String pi = "";
    if(widget.allData['profileimage'] != null){
      pi = widget.allData['profileimage'];
    }

    return DrawerHeader(
        decoration: BoxDecoration(
            color: bgColor
        ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Avatar(widget.allData['index'],30.0),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 5.0,),
            Row(
              children: [
                mainText(widget.allData['name'], textColor, 20.0, FontWeight.bold, 1),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                mainText(widget.allData['email'], lightGrey, 10.0, FontWeight.normal, 1),
                const Spacer(),
              ],
            ),
            
          ],
        )
    );
  }

  Widget buildMenu(BuildContext context) {
    return Stack(
      children: [
        Column(
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
              leading: const Icon(Iconsax.setting),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("Settings", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                navScreen(setting(), context, false);
              },
            ),

            ListTile(
              leading: const Icon(Iconsax.share),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("Invite", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                navScreen(Invite(), context, false);
              },
            ),

            // ListTile(
            //   leading: const Icon(Iconsax.notification),
            //   iconColor: mainColor,
            //   visualDensity: const VisualDensity(vertical: -3),
            //   focusColor: lightGrey,
            //   selectedTileColor: lightGrey,
            //   selectedColor: lightGrey,
            //   title:
            //   mainTextLeft("Notification Settings", mainColor, 13.0, FontWeight.normal, 1),
            //   onTap: () {
            //     navScreen(notificationsSettings(), context, false);
            //   },
            // ),

            ListTile(
              leading: const Icon(Iconsax.info_circle),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("About Us", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                navScreen(AboutUs(), context, false);
              },
            ),

            ListTile(
              leading: const Icon(Iconsax.call),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("Contact Us", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                navScreen(ContactUs(), context, false);
              },
            ),

            ListTile(
              leading: const Icon(Iconsax.shield),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("Privacy Policy", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                navScreen(PrivacyPolicy(), context, false);
              },
            ),

            ListTile(
              leading: const Icon(Iconsax.logout),
              iconColor: mainColor,
              visualDensity: const VisualDensity(vertical: -3),
              focusColor: lightGrey,
              selectedTileColor: lightGrey,
              selectedColor: lightGrey,
              title:
              mainTextLeft("Logout", mainColor, 13.0, FontWeight.normal, 1),
              onTap: () {
                bottoms(context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        mainText(" You wanna Logout?", textColor, 20.0, FontWeight.normal,1),
                        const SizedBox(height: 5.0,),
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              FirebaseAuth.instance.signOut().then((value) {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c) =>
                                    logIn()),
                                        (Route<dynamic> route) => false);
                              });
                            },
                              child: mainText("Logout", mainColor, 15.0, FontWeight.normal, 1),),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            },
                              child: mainText("Cancel", lightGrey, 15.0, FontWeight.normal, 1),)
                          ],
                        )

                      ],
                    )
                );
              },
            ),


          ],
        ),

      ],
    );
  }

}

// Future <List<String>> fetchUrl() async{
//   final response = await http.get("https://gefgkerg.com" as Uri);
//
// }
