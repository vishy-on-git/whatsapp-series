import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/NewCommunity/helparticlescreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Communityscreen1 extends StatefulWidget {
  const Communityscreen1({super.key});

  @override
  State<Communityscreen1> createState() => _Communityscreen1State();
}

class _Communityscreen1State extends State<Communityscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/ChatGPT Image Nov 28, 2025, 01_08_46 PM.png",
                  height: 170,
                ),
              ),
              SizedBox(height: 25),
              UiHelper.CustomText(
                text: "Create a new community",
                height: 24,
                fontweight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 18),
              UiHelper.CustomText(
                text: "Bring together a neighborhood, school",
                height: 15,
                color: Colors.grey[700],
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              UiHelper.CustomText(
                text: "or more. Create topic-based groups for",
                height: 15,
                color: Colors.grey[700],
              ),
              SizedBox(height: 5),
              UiHelper.CustomText(
                text: "members, and easily send them admin",
                height: 15,
                color: Colors.grey[700],
              ),
              SizedBox(height: 5),
              UiHelper.CustomText(
                text: "announcements.",
                height: 15,
                color: Colors.grey[700],
              ),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Helparticlescreen(),
                    ),
                  );
                },
                child: UiHelper.CustomText(
                  text: "See example communities >",
                  height: 15,
                  fontweight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.CustomButton(
        callback: () {

        },
        buttonname: "Get started",
      ),
    );
  }
}
