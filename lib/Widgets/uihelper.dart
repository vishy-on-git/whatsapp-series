import 'package:flutter/material.dart';

class UiHelper {
  static CustomButton({
    required VoidCallback callback,
    required String buttonname,
  }) {
    return SizedBox(
      height: 45,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(40),
      )),
        child: Text(
          buttonname,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  static CustomText({
    required String text,
    required double height,
    Color? color,
    FontWeight? fontweight,
  }) {
    //'!' ka natlab hai ki koi bhi chiz khaali nhi aa sakti
    return Text(
      text,
      style: TextStyle(
        fontSize: height,
        color: color ?? Color(0xFF00A884),
        fontWeight: fontweight,
      ),
    );
  }
}
