import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Chatscreen extends StatefulWidget {
  final String contactName;

  final String? contactAvatar;

  const Chatscreen({super.key, required this.contactName, this.contactAvatar});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(
                widget.contactAvatar ?? "assets/images/photo-camera 1.png",
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: UiHelper.CustomText(
                text: widget.contactName,
                height: 16,
                color: Colors.white,
                fontweight: FontWeight.bold,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "View contact",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "Search",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "New group",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "Media, links, and docs",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "Mute notification",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "Disappearing messages",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "Chat theme",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  child: UiHelper.CustomText(
                    text: "More",
                    height: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/ChatBackground.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
