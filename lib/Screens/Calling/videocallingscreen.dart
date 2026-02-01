import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class Videocallingscreen extends StatefulWidget {
  const Videocallingscreen({super.key});

  @override
  State<Videocallingscreen> createState() => _VideocallingscreenState();
}

class _VideocallingscreenState extends State<Videocallingscreen> {
  CameraController? controller;
  bool isInitialised = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) return;

    final cameras = await availableCameras();

    controller = CameraController(
      cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      ),
      ResolutionPreset.high,
      enableAudio: true,
    );

    await controller!.initialize();

    if (!mounted) return;

    setState(() {
      isInitialised = true;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isInitialised
          ? Stack(
              children: [
                Positioned.fill(child: CameraPreview(controller!)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          iconSize: 28,
                        ),
                        UiHelper.CustomText(
                          text: "Video calling...",
                          height: 16,
                          color: Colors.white,
                        ),
                        Icon(Icons.person, color: Colors.white, size: 26),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    height: 110,
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator(color: Colors.teal)),
    );
  }
}
