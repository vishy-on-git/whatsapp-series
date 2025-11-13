import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/Data/chatmodel.dart';

class Chatsview extends StatelessWidget {
  const Chatsview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatTile(
          chat: chats[index],
          imageUrl: "assets/images/photo-camera 1.png",
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  final Chatmodel chat;
  final String imageUrl;
  const ChatTile({super.key, required this.chat, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 3,
            left: 15,
            right: 20,
          ),
          child: CircleAvatar(
            foregroundImage: AssetImage(imageUrl),
            backgroundColor: Colors.black,
            radius: 26,
          ),

        ),
        Column(
          children: [
            Center(
              child: Text(
                "Vardhan",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ),
            SizedBox(height: 5),
            Text("Hey buddy!", style: TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );
  }
}
