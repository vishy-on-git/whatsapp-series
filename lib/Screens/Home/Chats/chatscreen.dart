import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_series/Screens/Calling/callingscreen.dart';
import 'package:whatsapp_series/Screens/Home/Data/message_model.dart';
import 'package:whatsapp_series/Widgets/message_bubble.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';
import 'package:whatsapp_series/services/chat_database_service.dart';

class Chatscreen extends StatefulWidget {
  final String contactName;

  final String? contactAvatar;

  const Chatscreen({super.key, required this.contactName, this.contactAvatar});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final ChatDatabaseService _db = ChatDatabaseService.instance;
  List<MessageModel> messages = [];

  final String currentUserId = "me";
  late String otherUserId;

  final TextEditingController msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool showSend = false;

  @override
  void initState() {
    super.initState();

    otherUserId = widget.contactName;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    msgController.addListener(() {
      setState(() {
        showSend = msgController.text.trim().isNotEmpty;
      });
    });

    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final data = await _db.getMessages(currentUserId, otherUserId);

    setState(() {
      messages = data.map((e) => MessageModel.fromMap(e)).toList();
    });
  }

  Future<void> _sendMessage() async {
    if (msgController.text.trim().isEmpty) return;

    await _db.insertMessage({
      "sender_id": currentUserId,
      "receiver_id": otherUserId,
      "message": msgController.text.trim(),
      "timestamp": DateTime.now().toIso8601String(),
      "status": 0,
    });

    msgController.clear();
    await _loadMessages();

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    msgController.dispose();
    super.dispose();
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
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Callingscreen(avatarImage: widget.contactAvatar),
                  ),
                );
              },
              icon: Icon(Icons.call),
            ),
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

          messages.isEmpty
              ? Center(
                  child: UiHelper.CustomText(
                    text: "No message yet",
                    color: Colors.white,
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
            padding: const EdgeInsets.only(bottom: 5,top: 10,right: 20),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe = msg.senderId == currentUserId;

                    return MessageBubble(
                        message:msg,
                        isMe: isMe,
                    );
                  },
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                          controller: msgController,
                          minLines: 1,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),

                      Icon(Icons.attach_file_outlined, color: Colors.grey[700]),
                      SizedBox(width: 6),
                      Icon(Icons.camera_alt, color: Colors.grey[700]),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Send Pressed");
                  _sendMessage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF00A884),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    showSend ? Icons.send : Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//dinanath was here bro.!!!!!!!!!!!!!!!