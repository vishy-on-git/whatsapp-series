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
  final TextEditingController msgController=TextEditingController();
  bool showSend=false;


  @override
  void initState(){
    super.initState();

    msgController.addListener((){
      setState(() {
        showSend=msgController.text.trim().isNotEmpty;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
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
      backgroundColor: Colors.transparent,
      bottomSheet: SafeArea(
        bottom: true,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(8),
          child: Row(
            spacing: 8.0,
            children: [
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(40),
                    color: Colors.white,
                  ),
                  child: Row(children: [
                    Icon(Icons.emoji_emotions_outlined,color: Colors.grey[400],),
                    SizedBox(width: 6,),
                    Expanded(
                      child: TextField(
                        controller: msgController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: "Message",
                          border: InputBorder.none
                        ),
                      ),
                    ),

                    Icon(Icons.attach_file_outlined,color: Colors.grey[700],),
                    SizedBox(width: 6,),
                    Icon(Icons.camera_alt,color: Colors.grey[700],)
                  ],)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00A884),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(12),
                child: Icon(showSend?Icons.send:Icons.mic,color: Colors.white,),
              ),
            ],
          ),
        ),
      )
    );
  }
}
