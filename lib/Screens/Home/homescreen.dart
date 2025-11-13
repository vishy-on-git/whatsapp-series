import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/chatsview.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: UiHelper.CustomText(
            text: "WhatsApp",
            height: 20,
            color: Colors.white,
            fontweight: FontWeight.bold,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                Tab(text: "CHATS"),
                Tab(text: "STATUS"),
                Tab(text: "CALLS"),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(color: Colors.red,),
          Chatsview(),
          Container(color: Colors.blue,),
          Container(color: Colors.cyan,),
        ]),
      ),
    );
  }
}
