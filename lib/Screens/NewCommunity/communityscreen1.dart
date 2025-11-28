import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Communityscreen1 extends StatefulWidget {
  const Communityscreen1({super.key});

  @override
  State<Communityscreen1> createState() => _Communityscreen1State();
}

class _Communityscreen1State extends State<Communityscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Color(0xFFe5ffda),child: Image.asset("assets/images/CommunityScreen_bg.png",height: 150)),
                SizedBox(height: 10),
                UiHelper.CustomText(text: "Create a new community", height: 22,color: Colors.black),
                SizedBox(height: 12),
                UiHelper.CustomText(
                  text: "Bring together a neighborhood, school",
                  height: 15,color: Colors.grey[700]
                ),
                SizedBox(height: 5),
                UiHelper.CustomText(
                  text: "or more. Create topic-based groups for",
                  height: 15,color: Colors.grey[700]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
