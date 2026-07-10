import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/Data/message_model.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final VoidCallback? onLongPress;

  const MessageBubble({super.key, required this.message, required this.isMe, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Align(
        alignment: isMe
            ? AlignmentGeometry.centerRight
            : AlignmentGeometry.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxWidth: 260),
                decoration: BoxDecoration(
                  color: isMe ? const Color(0xFFE9F8DF) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: UiHelper.CustomText(
                  text: message.message,
                  height: 14,
                  color: Colors.black,
                ),
              ),
      
              Positioned(
                right: isMe ? -2 : null,
                left: isMe ? null : -2,
                top: 0,
                child: CustomPaint(
                  painter: ChatBubbleTail(
                    color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
                    isMe: isMe,
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

class ChatBubbleTail extends CustomPainter{
  final Color color;
  final bool isMe;

  ChatBubbleTail({required this.color,required this.isMe});

  @override
  void paint(Canvas canvas, Size size){
    final paint=Paint()..color=color;
    final path=Path();

    if(isMe){
      path.moveTo(0, 0);
      path.lineTo(10, 0);
      path.lineTo(0, 10);
    }else{
      path.moveTo(10, 0);
      path.lineTo(10, 10);
      path.lineTo(0, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}

