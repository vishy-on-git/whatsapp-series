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

      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),

            SizedBox(height: 10),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Icon(Icons.attach_file, color: Colors.grey[700],),

            SizedBox(height: 12,),

            Icon(Icons.camera_alt,color: Colors.grey[700],),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00A884)
              ),
              padding: EdgeInsets.all(12),
              child: Icon(Icons.mic,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
