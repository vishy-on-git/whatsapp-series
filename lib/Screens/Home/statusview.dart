import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/Data/statusmodel.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Statusview extends StatelessWidget {
  const Statusview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length,
      itemBuilder: (BuildContext context, int index) {
        return StatusTile(status: statuses[index]);
      },
    );
  }
}




class StatusTile extends StatelessWidget {
  final Statusmodel status;

  const StatusTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8.0,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFF00A884),
                  Color(0xFF04BF8A),
                  Color(0xFF00A884),
                ],
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(status.imageURL),
              ),
            ),
          ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              UiHelper.CustomText(text: statuses[0].name, height: 16,fontweight: FontWeight.bold, color: Colors.black),
              UiHelper.CustomText(text: status.timeAgo.toString(), height: 10,color: Color(0xFF3A4B55))
            ],
          ))
        ],
      ),
    );
  }
}
