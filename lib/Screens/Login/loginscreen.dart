import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Container(
              width: 350,
              margin: const EdgeInsets.all(16),
            ),
          )
      ),
    );
  }
}