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

          //circular icon
          //------------------------------------
          CircleAvatar(
            radius: 75.0,
            child: Icon(
              Icons.done,
              size: 100.0,
              color: Colors.white,
            ),
            backgroundColor: const Color(0xFF04A489),
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
                        fontSize: 32,
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
      )),
    );
  }
}
