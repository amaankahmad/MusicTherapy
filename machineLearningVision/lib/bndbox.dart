import 'package:flutter/material.dart';
import 'dart:math';

import 'package:machineLearningVision/feedback_page.dart';

const String posenet = "PoseNet";
const max_angle = 173;
const min_angle = 40;

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;
  final List<double> movement;
  final List<double> angles;
  final List<double> percentage_result;
  var state;

  BndBox(
      this.results,
      this.previewH,
      this.previewW,
      this.screenH,
      this.screenW,
      this.model,
      this.movement,
      this.angles,
      this.percentage_result,
      this.state);

  @override
  Widget build(BuildContext context) {
    // var angle_prog = [];
    double shoulderX, elbowX, wristX;
    double shoulderY, elbowY, wristY;
    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      var perc;
      String feedback;
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

          if (k["part"] == "rightElbow" ||
              k["part"] == "rightWrist" ||
              k["part"] == "rightShoulder") {
            // print("${k["part"]}: (${x - 6}, ${y - 6})");

            if (k["part"] == "rightShoulder") {
              shoulderX = x - 6;
              shoulderY = y - 6;
            }
            if (k["part"] == "rightElbow") {
              elbowX = x - 6;
              elbowY = y - 6;
            }
            if (k["part"] == "rightWrist") {
              wristX = x - 6;
              wristY = y - 6;
            }
            if (shoulderX != null && elbowX != null && wristX != null) {
              angle = getAngle(
                  shoulderX, shoulderY, elbowX, elbowY, wristX, wristY);

              double angle_deg = angle * 180 / 3.1415;
              // print(angle);
              // if (movement[movement.length - 1] -
              //         movement[movement.length - 3] <
              //     0.5) {
              //   if (angle - movement[movement.length - 3] > 0.5) {
              //     print(
              //         "REP COUNTED! Angle difference = ${movement[movement.length - 1]}");
              //   }
              // }
              //double comp_angle = compare(movement, state);
              movement.add(angle);
              if (compare(movement, state)) {
                // print(
                //     "REP COUNTED! Angle difference = ${movement[movement.length - 1]}");
                //ADD up/down  ANGLES INTO ANGLES LIST
                angles.add(angle_deg);
                //print('ANGLE: $angles');

                if (angle_deg < max_angle && angle_deg > 90) {
                  percentage_result.add(angle_deg / max_angle * 100);
                } else if (angle_deg > max_angle) {
                  percentage_result.add(100);
                } else if (angle_deg < 90 && angle_deg > min_angle) {
                  percentage_result.add(min_angle / angle_deg * 100);
                } else if (angle_deg < min_angle) {
                  percentage_result.add(100);
                }
              }

              print(angles);
              //movement.add(angle);
              // print(movement);
            }
          }

          return Stack(
            children: [
              Positioned(
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
              ),
              Positioned(
                bottom: 2,
                child: Container(
                  width: 500,
                  height: 500,
                  child: GestureDetector(
                    onTap: () {
                      feedback = response(angles);
                      perc = calc_avg(percentage_result);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FeedbackPage(
                            movement: movement,
                            percentage: perc,
                            feedback: feedback,
                          ),
                        ),
                      );
                      // print("CLICKED");
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Create Exercises',
                            style: TextStyle(
                              color: Colors.transparent,
                              //fontFamily: 'Museo',
                              fontSize: 30,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
  return angle;
}

bool state = false;
bool compare(List<double> movement, bool astate) {
  int end = movement.length - 1;
  double angle = movement[end] / 3.1415 * 180;

  double d1 = movement[end] - movement[end - 2];
  double d2 = movement[end] - movement[end - 2];

  d1 = (d1 > 0) ? d1 : (-d1);
  d2 = (d2 > 0) ? d2 : (-d2);

  double threshold = 0.03;

  bool isStopping = d1 < threshold && d2 < threshold;

  //print('hello');
  if (angle > 90 && isStopping && state == true) {
    //print('$angle');
    // print('down');
    // print('$angle');
    state = false;
    return true;
  } else if (angle < 90 && isStopping && state == false) {
    // print('up');
    // print('$angle');
    state = true;
    return true;
  }
  // angle = movement[end];
  // print('$angle');

  /*
  v
  double avg_1 = ((movement[end] +
          movement[end - 1] +
          movement[end - 2] +
          movement[end - 3] +
          movement[end - 4] +
          movement[end - 5] +
          movement[end - 6] +
          movement[end - 7] +
          movement[end - 8] +
          movement[end - 9] +
          movement[end - 10] +
          movement[end - 11] +
          movement[end - 12] +
          movement[end - 13] +
          movement[end - 14] +
          movement[end - 15]) /
      16);

  double avg_2 = ((movement[end - 16] +
          movement[end - 17] +
          movement[end - 18] +
          movement[end - 19] +
          movement[end - 20] +
          movement[end - 21] +
          movement[end - 22] +
          movement[end - 23] +
          movement[end - 24] +
          movement[end - 25] +
          movement[end - 26] +
          movement[end - 27] +
          movement[end - 28] +
          movement[end - 29] +
          movement[end - 30] +
          movement[end - 31]) /
      16);
  double diff = avg_1 - avg_2;
  print("$diff");
  */
  // if (avg_2 - avg_1 > 0.75) {
  //   return true;
  // }
  return false;
}

int calc_avg(List<double> percentages) {
  double sum = 0;
  for (int i = 0; i < percentages.length; i++) {
    sum = percentages[i] + sum;
  }
  return (sum / (percentages.length)).round();
}

String response(List<double> angles) {
  double up = 0;
  double down = 0;
  for (int i = 0; i < angles.length; i++) {
    if (angles[i] < 90) {
      up = up + (min_angle - angles[i]);
    } else {
      down = down + (max_angle - angles[i]);
    }
  }
  if ((up / angles.length) > (down / angles.length)) {
    return "For next session: Focus on lifting arm completely upwards";
  } else {
    return "For next session: Focus on extending arm completely downwards";
  }
}
