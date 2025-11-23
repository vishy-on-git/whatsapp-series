import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/Data/callmodel.dart';

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
              child: const Icon(Icons.link, color: Colors.white),
            ),
            title: const Text(
              "Create call link",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: const Text("Share a link for your WhatsApp call"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              "Recent",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          ...callList.map((call) {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(call.imageURL),
              ),
              title: Text(
                call.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: call.isMissed ? Colors.red : Colors.black,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    call.isIncoming ? Icons.call_received : Icons.call_made,
                    color: call.isMissed ? Colors.red : Colors.green,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _formatTime(call.time),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: Icon(
                call.isVideoCall ? Icons.videocam : Icons.call,
                color: Colors.teal,
              ),
            );
          }).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
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
