import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: UiHelper.CustomText(text: "Account", height: 23,color: Colors.white,fontweight: FontWeight.bold,)
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.security_sharp,color: Colors.grey[700],size: 30,),
                  SizedBox(width: 16,),
                  UiHelper.CustomText(text: "Security notifications",height: 16,color: Colors.grey[900])
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/ChatGPT Image Dec 11, 2025, 03_09_31 PM.png",height: 40,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
