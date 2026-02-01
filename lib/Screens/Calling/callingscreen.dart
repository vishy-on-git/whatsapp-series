import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Callingscreen extends StatelessWidget {
  final String? avatarImage;

  const Callingscreen({super.key, this.avatarImage});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                avatarImage ??
                    "assets/images/ChatGPT Image Nov 30, 2025, 12_55_17 AM.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Lock_icon.png",
                        height: 20,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 5,),
                      UiHelper.CustomText(
                        text: "End-to-end encrypted",
                        height: 16,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/ChatGPT Image Dec 2, 2025, 10_32_56 PM.png",
                    height: 20,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        minimum: EdgeInsets.only(bottom: 40),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            height: 90,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFF1C1C1C),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.flip_camera_ios),
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bluetooth),
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.photo_camera),
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                  iconSize: 30,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.call_end),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
