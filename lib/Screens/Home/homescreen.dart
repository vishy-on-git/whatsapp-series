import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/callsview.dart';
import 'package:whatsapp_series/Screens/Home/chatsview.dart';
import 'package:whatsapp_series/Screens/Home/statusview.dart';
import 'package:whatsapp_series/Screens/Login/loginscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
          children: [
            Container(color: Colors.red),
            Chatsview(),
            Statusview(),
            CallsView(),
          ],
        ),
      ),
    );
  }
}
