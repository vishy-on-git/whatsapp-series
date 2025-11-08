import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phNumber});
  final String phNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                UiHelper.CustomText(
                  text: "Verifying your number",
                  height: 19,
                  fontweight: FontWeight.bold,
                ),
                SizedBox(height: 30),
                UiHelper.CustomText(
                  text: "You've tried to register +${phNumber}",
                  height: 14,
                  color: Color(0xFF5E5E5E),
                ),
                SizedBox(height: 5),
                UiHelper.CustomText(
                  text: "recently. Wait before requesting an SMS or a call.",
                  height: 14,
                  color: Color(0xFF5E5E5E),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomText(
                      text: "with your code. ",
                      height: 14,
                      color: Color(0xFF5E5E5E),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: UiHelper.CustomText(
                        text: "Wrong Number?",
                        height: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
