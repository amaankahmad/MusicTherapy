import 'package:flutter/material.dart';
import 'package:musictherapy/main.dart';
import 'package:camera/camera.dart';

class MLVision extends StatefulWidget {
  @override
  _MLVisionState createState() => _MLVisionState();
}

class _MLVisionState extends State<MLVision> {
  bool isWorking = false;

  String result = "";

  CameraController cameraController;

  CameraImage imgCamera;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                }
            });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF57E00);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final yellow = const Color(0xFFFFC247);
    final honeydew = const Color(0xFFF1FAEE);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/other/cameraimage.jpg'),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.025,
            ),
            Center(
              child: Container(
                height: 250,
                width: 250,
                child: Image.asset('assets/images/other/cameraicon.png'),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  initCamera();
                },
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.1),
                  height: 250,
                  width: 250,
                  child: imgCamera == null
                      ? Container(
                          // Is null
                          height: 270,
                          width: 360,
                          child: Icon(
                            Icons.photo_camera_front,
                            color: blue,
                            size: 40,
                          ),
                        )
                      : AspectRatio(
                          // Else
                          aspectRatio: cameraController.value.aspectRatio,
                          child: CameraPreview(cameraController),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
