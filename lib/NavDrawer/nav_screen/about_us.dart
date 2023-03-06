import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    const String1 = 'Ibento is an event management platform developed by ASPER, a team of enthusiastic designers and developers. This app allows users to create, share, find and attend events that fuel their passions and enrich their lives. Seamless planning for all kinds of forums from workshops, bootcamps, to community conferences, as well as contests.\n\n'
        'Our focus is to elevate your events from ordinary to extraordinary with the touch of a button and assist people in locating all types of happenings at one location, effortlessly.\n\n'
        'Our mission is to bring people together as a social network so they can discover and share events that align with their interests.';
    return Scaffold(
      appBar: AppBar(
        elevation:0,
          backgroundColor:Colors.transparent,

      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24, vertical:15),
              child: RichText(
                text: const TextSpan(text: 'AboutUs', style: TextStyle(color: Colors.white,fontSize:24, fontWeight:FontWeight.w700,
                ),
                ),
              ),
            ),
            Divider(color: Colors.white30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24, vertical:15),
              child: RichText(
                  textAlign: TextAlign.start,
                  text:TextSpan(text :String1, style: TextStyle(color: Colors.grey,fontSize:14))),
            ),

          ],
        ),
      ),

    );
  }
}