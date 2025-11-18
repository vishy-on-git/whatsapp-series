import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/Data/statusmodel.dart';

class Statusview extends StatelessWidget {
  const Statusview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: statuses.length,itemBuilder: (BuildContext context, int index){
      //return
    },);
  }
}

class StatusTile extends StatelessWidget {
  final Statusmodel status;

  const StatusTile({super.key,required this.status});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 12),
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8.0,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(status.imageURL),
          ),
        ],
      ),
    );
  }
}
