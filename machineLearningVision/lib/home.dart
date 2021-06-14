import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';

const String posenet = "PoseNet";
bool state;

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  //bool state = true;
  String _model = "";
  List<double> angles = [];
  List<double> percentage_result = [];
  List<double> movement = [
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14,
    3.14
  ];
  double percent = 0;

  double result() {
    setState(() {
      percent = percentage_result[percentage_result.length];
      return percent;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    if (state == null) {
      state = false;
    }
    state ^= true;
    return Scaffold(
      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: const Text(posenet),
                    onPressed: () => onSelect(posenet),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                /*Container(
                  // Put play page here
                  width: screen.width,
                  height: screen.height,
                  decoration: BoxDecoration(color: Colors.red),
                ),*/
                // Container(
                //   alignment: Alignment.bottomRight,
                //   margin: EdgeInsets.all(30),
                //   color: Colors.transparent,
                //   child: ElevatedButton(
                //       onPressed: result,
                //       child: Text('$percent', textAlign: TextAlign.center)),
                // ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model,
                    movement,
                    angles,
                    percentage_result,
                    state),
              ],
            ),
    );
  }
}
