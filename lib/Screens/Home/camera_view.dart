import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker picker = new ImagePicker();
  XFile? capturedImage;

  Future<void> openCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        capturedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: capturedImage == null
            ? UiHelper.CustomText(
                text: "Tap the camera button to take the picture",
                height: 16,
              )
            : Image.file(File(capturedImage!.path)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.camera_alt, color: Colors.black),
        onPressed: openCamera,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
