import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Calling/callingscreen.dart';
import 'package:whatsapp_series/Screens/Calling/videocallingscreen.dart';
import 'package:whatsapp_series/Screens/Home/Data/callmodel.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class CallsView extends StatelessWidget {

  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.teal,
              child: Transform.rotate(
                angle: 135 * 3.1415926535 / 180,
                child: Icon(Icons.link, color: Colors.white, size: 28.0),
              ),
            ),
            title: UiHelper.CustomText(
              text: "Create call link",
              height: 16,
              fontweight: FontWeight.bold,
              color: Colors.black,
            ),
            subtitle: const Text("Share a link for your WhatsApp call"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: UiHelper.CustomText(
              text: "Recent",
              height: 14,
              fontweight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          ...callList.map((call) {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(call.imageURL),
              ),
              title: UiHelper.CustomText(
                text: call.name,
                color: call.isMissed ? Colors.red : Colors.black,
                fontweight: FontWeight.bold,
              ),
              subtitle: Row(
                children: [
                  Icon(
                    call.isIncoming ? Icons.call_received : Icons.call_made,
                    color: call.isMissed ? Colors.red : Colors.green,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  UiHelper.CustomText(text: _formatTime(call.time),color: Colors.grey)
                ],
              ),
              trailing: InkWell(
                onTap: (){
                  call.isVideoCall ? Navigator.push(context, MaterialPageRoute(builder: (context)=>Videocallingscreen())) : Navigator.push(context, MaterialPageRoute(builder: (context)=>Callingscreen()));
                },
                child: Icon(
                  call.isVideoCall ? Icons.videocam : Icons.call,
                  color: Color(0xFF00A884),
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF00A884),
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final duration = DateTime.now().difference(time);
    if (duration.inMinutes < 60) {
      return "${duration.inMinutes} minutes ago";
    } else if (duration.inHours < 24) {
      return "${duration.inHours} hours ago";
    } else {
      return "${time.day}/${time.month}, ${time.hour}:${time.minute.toString().padLeft(2, '0')}";
    }
  }
}
