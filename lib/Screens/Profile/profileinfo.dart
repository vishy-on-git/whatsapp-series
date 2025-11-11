import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/homescreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              UiHelper.CustomText(
                text: "Profile info",
                height: 16,
                fontweight: FontWeight.bold,
              ),
              SizedBox(height: 25),
              UiHelper.CustomText(
                text: "Please provide your name and an optional",
                height: 14,
                color: Color(0xFF5E5E5E),
              ),
              SizedBox(height: 5),
              UiHelper.CustomText(
                text: "profile photo",
                height: 14,
                color: Color(0xFF5E5E5E),
              ),
              SizedBox(height: 22),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEAEAEA),
                ),
                height: 101,
                width: 120,
                child: Center(
                  child: Image.asset("assets/images/photo-camera 1.png"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Color(0xFF05AA82)),
                    ),
                    hintText: "Type your name here",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
              (Route<dynamic>_)=>false
          );
        },
       buttonname: "Next"),
    );
  }
}
