import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Helparticlescreen extends StatelessWidget {
  const Helparticlescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        title: Align(
          alignment: AlignmentGeometry.topLeft,
          child: UiHelper.CustomText(
            text: "Help article",
            height: 23,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "browser",
                child: UiHelper.CustomText(
                  text: "Open in browser",
                  height: 16,
                  color: Colors.black,
                ),
              ),
              PopupMenuItem(
                value: "send",
                child: UiHelper.CustomText(
                  text: "Send",
                  height: 16,
                  color: Colors.black,
                ),
              ),
              PopupMenuItem(
                value: "copy_link",
                child: UiHelper.CustomText(
                  text: "Copy link",
                  height: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 18.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.CustomText(
              text: "Examples of communities on Whatsapp",
              height: 23,
              color: Colors.black,
              fontweight: FontWeight.bold,
            ),
            SizedBox(height: 10,),
            UiHelper.CustomText(text: "Communities on WhatsApp brings members together in topic-based groups. Below, you can find some example communities, as well as ways you can use communities.", height: 15,color: Colors.grey[600])
          ],
        ),
      ),
    );
  }
}
