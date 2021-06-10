// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';

class ConfirmExerciseUploadPage extends StatelessWidget {
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
      backgroundColor: const Color(0xFFF1FAEE),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //spacing
            //------------------------------------
            SizedBox(
              height: 150.0,
            ),
            //------------------------------------

            //circular icon with tick image
            //------------------------------------
            Center(
              child: Container(
                width: 160.0,
                height: 160.0,
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF04A489),
                  child: ClipOval(
                    child: Padding(
                        padding: EdgeInsets.all(35.0),
                        child: Image.asset("assets/images/other/tick1.png")),
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
              width: width * 0.75,
              margin: EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdminStartPage(),
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  shadowColor: const Color(0xFFF57E00),
                  color: const Color(0xFFFFC247),
                  elevation: 3,
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
