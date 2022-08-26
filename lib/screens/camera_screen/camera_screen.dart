import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/screens/camera_screen/random_image.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  var _cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _initCamera(int index) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameras[index], ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        //_showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      //_showCameraException(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  void _onSwitchCamera() {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras.length ? 0 : _cameraIndex + 1;
    _initCamera(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CameraPreview(controller),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: kLargePadding * 6),
            child: _buildGallery(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: kLargePadding * 1.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.flash_auto),
                  onPressed: () {},
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.switch_camera),
                  onPressed: _onSwitchCamera,
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: kSmallPadding / 2),
            child: Text(
              "Hold for video, tap for photo",
              style: TextStyle(color: kBackgroundColor),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildGallery() {
    return SizedBox(
      width: double.infinity,
      height: kLargeSize * 3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(kSmallPadding / 4),
              child: SizedBox(
                height: 40,
                width: 60,
                child: Image(
                  image: randomImageUrl(),
                  fit: BoxFit.cover,
                ),
              ),
            );
          })),
    );
  }
}
