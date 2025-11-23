import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_series/Screens/Home/Data/statusmodel.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Statusview extends StatelessWidget {
  const Statusview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return MyStatusTile();
        }
        if(index==1){
          return Padding(padding: EdgeInsets.only(top: 6,bottom: 6,left: 30),child: UiHelper.CustomText(text: "Recent Updates", height: 14,color: Color(0xFF758289)),);
        }
        return StatusTile(status: statuses[index - 2]);
      },
    );
  }
}

class MyStatusTile extends StatelessWidget {
  const MyStatusTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      height: 78,
      child: Row(
        spacing: 12,
        children: [
          Stack(
            children: [
              Container(
                height: 66,
                width: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "/Users/vishyaryan/StudioProjects/whatsapp_series/assets/images/black-silhouette-of-faceless-person-with-curly-hair-for-artistic-design-projects-vector.jpg",
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 1,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF00A884),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Column(
            spacing: 3.0,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiHelper.CustomText(text: "MyStatus", height: 15,color: Color(0xFF3A4B55),fontweight: FontWeight.bold),
              UiHelper.CustomText(text: "Tap to add status update", height: 11,color: Color(0xFF758289))
            ],
          ))
        ],
      ),
    );
  }
}

class StatusTile extends StatelessWidget {
  final Statusmodel status;

  const StatusTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String statusTime = DateFormat.jm().format(status.timeAgo);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 0.1,
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
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(status.imageURL),
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                UiHelper.CustomText(
                  text: status.name,
                  height: 16,
                  fontweight: FontWeight.bold,
                  color: Colors.black,
                ),
                UiHelper.CustomText(
                  text: statusTime,
                  height: 10,
                  color: Color(0xFF3A4B55),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
