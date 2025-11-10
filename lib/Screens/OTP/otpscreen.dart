import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Profile/profileinfo.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, required this.phNumber});
  final String phNumber;
  TextEditingController otp1controller =TextEditingController();
  TextEditingController otp2controller =TextEditingController();
  TextEditingController otp3controller =TextEditingController();
  TextEditingController otp4controller =TextEditingController();
  TextEditingController otp5controller =TextEditingController();
  TextEditingController otp6controller =TextEditingController();

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
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Feature coming soon!"),),);
                  },
                  child: UiHelper.CustomText(text: "Didn't receive code?", height: 14),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()),);
      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
