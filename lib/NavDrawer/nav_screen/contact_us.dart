import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    const String2 ='If you have any queries or suggestions about the application and its working, do not hesitate';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                text: const TextSpan(text: 'ContactUs', style: TextStyle(color: Colors.white,fontSize:24, fontWeight:FontWeight.w700,
                  letterSpacing: 1
                ),
                ),
              ),
            ),
            Divider(color: Colors.white30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24),
              child: RichText(
                  textAlign: TextAlign.start,
                  text:TextSpan(text :String2, style: TextStyle(color: Colors.grey,fontSize:14))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Link(
                uri: Uri.parse('https://www.google.com'),
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: Text('contact us at :Google.com',
                      style: TextStyle(color: Colors.white70)),
                ),
              ),
            ),




          ],
        ),
      ),

    );
  }
}