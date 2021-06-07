import 'package:flutter/material.dart';
import 'dart:math';

const String posenet = "PoseNet";

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model);

  @override
  Widget build(BuildContext context) {
    double shoulderX, elbowX, wristX;
    double shoulderY, elbowY, wristY;
    List<dynamic> angle_prog = [];
    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      results.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var angle;
          var scaleW, scaleH, x, y;

          if (screenH / screenW > previewH / previewW) {
            scaleW = screenH / previewH * previewW;
            scaleH = screenH;
            var difW = (scaleW - screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = screenW / previewW * previewH;
            scaleW = screenW;
            var difH = (scaleH - screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }

          if (k["part"] == "leftElbow" ||
              k["part"] == "leftWrist" ||
              k["part"] == "leftShoulder") {
            // print("${k["part"]}: (${x - 6}, ${y - 6})");

            if (k["part"] == "leftShoulder") {
              shoulderX = x - 6;
              shoulderY = y - 6;
            }
            if (k["part"] == "leftElbow") {
              elbowX = x - 6;
              elbowY = y - 6;
            }
            if (k["part"] == "leftWrist") {
              wristX = x - 6;
              wristY = y - 6;
            }
            if (shoulderX != null && elbowX != null && wristX != null) {
              angle = getAngle(
                  shoulderX, shoulderY, elbowX, elbowY, wristX, wristY);
              print(angle);
            }
          }

          return Positioned(
            left: x - 6,
            top: y - 6,
            width: 100,
            height: 12,
            child: Container(
              child: Text(
                "● ${k["part"]}",
                style: TextStyle(
                  color: Color.fromRGBO(37, 213, 253, 1.0),
                  fontSize: 12.0,
                ),
              ),
            ),
          );
        }).toList();

        lists..addAll(list);
      });

      return lists;
    }

    return Stack(children: model == posenet ? _renderKeypoints() : null);
  }
}

double getAngle(double shoulderX, double shoulderY, double elbowX,
    double elbowY, double wristX, double wristY) {
  // print("Shoulder position: ($shoulderX , $shoulderY)");
  // print("Elbow position: ($elbowX , $elbowY)");
  // print("Wrist position: ($wristX , $wristY)");

  double sh_to_el, el_to_wr, sh_to_wr;
  double angle;
  sh_to_el = sqrt(pow((shoulderX - elbowX), 2) + pow((shoulderY - elbowY), 2));
  el_to_wr = sqrt(pow((elbowX - wristX), 2) + pow((elbowY - wristY), 2));
  sh_to_wr = sqrt(pow((shoulderX - wristX), 2) + pow((shoulderY - wristY), 2));

  angle = acos(((pow(sh_to_el, 2) + pow(el_to_wr, 2) - pow(sh_to_wr, 2)) /
      (2 * sh_to_el * el_to_wr)));

  // print("Angle at elbow joint: $angle");
}
