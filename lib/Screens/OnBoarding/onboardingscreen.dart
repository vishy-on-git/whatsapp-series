import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Login/loginscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/image 1.png"),
            SizedBox(height: 30),
            UiHelper.CustomText(
              text: "Welcome to WhatsApp",
              height: 20,
              color: Color(0xFF000000),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(
                  text: "Read out ",
                  height: 14,
                  color: Color(0xFF5E5E5E),
                ),
                UiHelper.CustomText(
                  text: "Privacy Policy. ",
                  height: 14,
                  color: Color(0xFF0C42CC),
                ),
                UiHelper.CustomText(
                  text: "Tap \"Agree and continue\"",
                  height: 14,
                  color: Color(0xFF5E5E5E),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(
                  text: "to accept the",
                  height: 13,
                  color: Color(0xFF5E5E5E),
                ),
                UiHelper.CustomText(
                  text: "Terms of Services.",
                  height: 13,
                  color: Color(0xFF0C42CC),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        buttonname: "Agree and continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
