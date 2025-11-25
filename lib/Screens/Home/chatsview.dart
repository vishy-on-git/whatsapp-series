import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_series/Screens/Home/Chats/chatscreen.dart';
import 'package:whatsapp_series/Screens/Home/Data/chatmodel.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Chatsview extends StatelessWidget {
  const Chatsview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chatscreen(
                  contactName: chats[index].contactName,
                  contactAvatar: chats[index].image,
                ),
              ),
            );
          },
          child: ChatTile(chat: chats[index]),
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  final Chatmodel chat;

  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat.jm();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(
              chat.image ?? "assets/images/photo-camera 1.png",
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UiHelper.CustomText(
                  text: chat.contactName,
                  height: 14,
                  fontweight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
                UiHelper.CustomText(
                  text: chat.text,
                  height: 13,
                  color: Color(0xFF889095),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          Column(
            children: [
              UiHelper.CustomText(
                text: format.format(chat.time).toString(),
                height: 14,
                color: Color(0xFF026500),
                fontweight: FontWeight.bold,
              ),
              UnreadCount(unreadCount: chat.count),
            ],
          ),
        ],
      ),
    );
  }
}

class UnreadCount extends StatelessWidget {
  final int unreadCount;
  const UnreadCount({super.key, required this.unreadCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF036A01),
        shape: BoxShape.circle,
      ),
      child: UiHelper.CustomText(
        text: unreadCount.toString(),
        height: 12,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
