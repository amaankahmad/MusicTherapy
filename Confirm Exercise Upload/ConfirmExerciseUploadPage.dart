// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConfirmExerciseUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //spacing
            //------------------------------------
            SizedBox(
              height: 180.0,
            ),
            //------------------------------------

            //circular icon with tick image
            //------------------------------------
            Center(
              child: Container(
                width: 130.0,
                height: 130.0,
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF04A489),
                  child: ClipOval(
                    child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset("assets/tick2.png")),
                  ),
                ),
              ),
            ),
            //------------------------------------

            //spacing
            //------------------------------------
            SizedBox(
              height: 80.0,
            ),
            //------------------------------------

            //middle text
            //------------------------------------
            Text(
              'Exercise Video',
              style: TextStyle(
                fontFamily: 'Museo',
                color: const Color(0xFFF57E00),
                fontSize: 50.0,
              ),
              textAlign: TextAlign.center,
            ),
            //------------------------------------

            //middle text
            //------------------------------------
            Text(
              'uploaded',
              style: TextStyle(
                fontFamily: 'Museo',
                color: const Color(0xFF1E325C),
                fontSize: 50.0,
              ),
              textAlign: TextAlign.center,
            ),
            //------------------------------------

            //middle text
            //------------------------------------
            Text(
              'successfully!',
              style: TextStyle(
                fontFamily: 'Museo',
                color: const Color(0xFF1E325C),
                fontSize: 50.0,
              ),
              textAlign: TextAlign.center,
            ),
            //------------------------------------

            //spacing
            //------------------------------------
            SizedBox(
              height: 80.0,
            ),
            //------------------------------------

            //button
            //------------------------------------
            Container(
              height: 100.0,
              width: 300.0,
              margin: EdgeInsets.all(20.0),
              child: Material(
                borderRadius: BorderRadius.circular(40),
                shadowColor: Colors.blue,
                color: const Color(0xFFFFC247),
                elevation: 5,
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Go back to Home Page',
                        style: TextStyle(
                          color: Colors.white,
                          //fontFamily: 'Museo',
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //------------------------------------
          ],
        ),
        //------------------------------------------------
      ),
    );
  }
}
