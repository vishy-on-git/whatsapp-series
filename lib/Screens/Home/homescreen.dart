import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_series/Screens/Home/callsview.dart';
import 'package:whatsapp_series/Screens/Home/camera_view.dart';
import 'package:whatsapp_series/Screens/Home/chatsview.dart';
import 'package:whatsapp_series/Screens/Home/statusview.dart';
import 'package:whatsapp_series/Screens/Login/loginscreen.dart';
import 'package:whatsapp_series/Screens/NewCommunity/communityscreen1.dart';
import 'package:whatsapp_series/Screens/Settings/settingscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Homescreen extends StatefulWidget {
  final XFile? profileImage;


  const Homescreen({super.key,this.profileImage});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  XFile? get profileImage=>widget.profileImage;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 90,
          title: UiHelper.CustomText(
            text: "WhatsApp",
            height: 20,
            color: Colors.white,
            fontweight: FontWeight.bold,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "new_group",
                  child: UiHelper.CustomText(
                    text: "New group",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Communityscreen1()));
                  },
                  value: "new_community",
                  child: UiHelper.CustomText(
                    text: "New community",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "broadcast_lists",
                  child: UiHelper.CustomText(
                    text: "Broadcast lists",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "linked_devices",
                  child: UiHelper.CustomText(
                    text: "Linked devices",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "starred",
                  child: UiHelper.CustomText(
                    text: "Starred",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "read_all",
                  child: UiHelper.CustomText(
                    text: "Read all",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settingscreen(displayPhoto: profileImage,)),
                    );
                  },
                  value: "settings",
                  child: UiHelper.CustomText(
                    text: "Settings",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  value: "logout",
                  child: UiHelper.CustomText(
                    text: "Logout",
                    height: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(
                  child: UiHelper.CustomText(
                    text: "CHATS",
                    height: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Tab(
                  child: UiHelper.CustomText(
                    text: "STATUS",
                    height: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Tab(
                  child: UiHelper.CustomText(
                    text: "CALLS",
                    height: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [CameraView(), Chatsview(), Statusview(), CallsView()],
        ),
      ),
    );
  }
}
