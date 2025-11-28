import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_series/Screens/Home/homescreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Settingscreen extends StatelessWidget {
  final XFile? displayPhoto;

  const Settingscreen({super.key, this.displayPhoto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 5.0),
        title: UiHelper.CustomText(
          text: "Settings",
          height: 24,
          fontweight: FontWeight.bold,
          color: Colors.white,
        ),
        actions: [Icon(Icons.search, size: 30), SizedBox(width: 5.0)],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                spacing: 15.0,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: displayPhoto != null
                        ? FileImage(File(displayPhoto!.path))
                        : AssetImage("assets/images/photo-camera 1.png") as ImageProvider,
                  ),
                  Expanded(
                    child: Column(
                      spacing: 5.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.CustomText(
                          text: "Aryan",
                          height: 20,
                          color: Colors.black,
                        ),
                        UiHelper.CustomText(
                          text: "Hey there! I am using Whatsapp",
                          height: 14,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.qr_code, color: Color(0xFF00A884)),
                  Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFF00A884),
                    weight: 8,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[500], thickness: 0.09),
            Padding(
              padding: const EdgeInsets.all(14.8),
              child: Row(
                spacing: 20.0,
                children: [
                  Image.asset("assets/images/key_ic.png",height: 35,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Account", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Security notifications, change number", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(14.8),
                child: Row(
                  spacing: 20.0,
                  children: [
                    Icon(Icons.lock_outline,color: Colors.grey[700],size: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.0,
                      children: [
                        UiHelper.CustomText(text: "Privacy", height: 18,color: Colors.black),
                        UiHelper.CustomText(text: "Block contacts, disappearing messages", height: 15,color: Colors.grey[700])
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 10),
              child: Row(
                spacing: 10.0,
                children: [
                  Image.asset("assets/images/HeartedFace.png",height: 45,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Avatar", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Create, edit, profile photo", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                spacing: 15.0,
                children: [
                  Image.asset("assets/images/Library_icon.png",height: 40,width: 40,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Lists", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Manage people and groups", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.8,horizontal: 3),
              child: Row(
                spacing: 0.3,
                children: [
                  Image.asset("assets/images/Chat_icon.png",height: 65,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Chats", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Theme, wallpapers, chat history", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                spacing: 5.0,
                children: [
                  Image.asset("assets/images/Broadcast_icon.png",width: 57,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Broadcasts", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Manage lists and send broadcasts", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 21),
              child: Row(
                spacing: 20.0,
                children: [
                  Icon(Icons.notifications_none_outlined,size: 30,color: Colors.grey[700],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Notifications", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Message, group and call tone", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 15),
              child: Row(
                spacing: 8.0,
                children: [
                  Image.asset("assets/images/Storage_icon.png",height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Storage and data", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Network usage, auto-download", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 27),
              child: Row(
                spacing: 20.0,
                children: [
                  Icon(Icons.accessibility,color: Colors.grey[700],size: 27,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Accessibility", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Increase contrast, animation", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 27),
              child: Row(
                spacing: 20.0,
                children: [
                  Icon(Icons.language_outlined,color: Colors.grey[700],size: 27,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "App language", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "English (device's language)", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 27),
              child: Row(
                spacing: 20.0,
                children: [
                  Icon(Icons.help_outline,color: Colors.grey[700],size: 27,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Help and feedback", height: 18,color: Colors.black),
                      UiHelper.CustomText(text: "Help centre, contact us, privacy policy", height: 15,color: Colors.grey[700])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.8,horizontal: 27),
              child: Row(
                spacing: 20.0,
                children: [
                  Icon(Icons.people_alt_outlined,color: Colors.grey[700],size: 27,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      UiHelper.CustomText(text: "Invite a friend", height: 18,color: Colors.black),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
