import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/images.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  final bool isCamTab;
  const CameraScreen({Key? key, required this.isCamTab}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  var _cameraIndex = 0;
  bool flash = false;
  bool isRecording = false;

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
            //print('User denied camera access.');
            break;
          default:
            //print('Handle other errors.');
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
    await controller.dispose();
    controller = CameraController(cameras[index], ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        //print(controller.value.errorDescription);
      }
    });

    try {
      await controller.initialize();
    } on CameraException {
      //print(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  void _onSwitchCamera() {
    if (!controller.value.isInitialized || controller.value.isTakingPicture) {
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
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(controller),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: kLargePadding * 2, right: kMedPadding),
            child: Align(
              alignment: Alignment.topRight,
              child: widget.isCamTab == false
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close,
                          size: 28, color: kBackgroundColor))
                  : null,
            ),
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
              padding: const EdgeInsets.only(bottom: kLargePadding * 1.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        flash ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          flash = !flash;
                        });
                        flash
                            ? controller.setFlashMode(FlashMode.torch)
                            : controller.setFlashMode(FlashMode.off);
                      }),
                  GestureDetector(
                    onLongPress: () async {
                      await controller.startVideoRecording();
                      setState(() {
                        isRecording = true;
                      });
                    },
                    onLongPressUp: () async {
                      setState(() {
                        isRecording = false;
                      });
                    },
                    child: isRecording
                        ? const Icon(
                            Icons.radio_button_on,
                            color: Colors.red,
                            size: 80,
                          )
                        : const Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
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
      ),
    );
  }

  SizedBox _buildGallery() {
    return SizedBox(
      width: double.infinity,
      height: kLargeSize * 3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgData.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(kSmallPadding / 4),
              child: SizedBox(
                height: 40,
                width: 60,
                child: Image(
                  image: randomImageUrl(index + 1),
                  fit: BoxFit.cover,
                ),
              ),
            );
          })),
    );
  }

  ImageProvider randomImageUrl(int index) {
    if (index > 5) {
      int a = index - 5;
      index = a;
    }
    return AssetImage("assets/images/mount$index.jpg");
  }
}
