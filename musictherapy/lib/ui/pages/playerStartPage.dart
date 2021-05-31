//samus
//update 19th jan

import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/selectExercise.dart';
import 'package:musictherapy/ui/pages/selectMusic.dart';
import 'package:musictherapy/ui/pages/settings.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/addAdmin.dart';

class PlayerStartPage extends StatelessWidget {
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
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
// --------- BACK BUTTON --------------
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10000),
                  shadowColor: const Color(0xFF1E325C),
                  elevation: 5,
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset(
                        'assets/images/navigation/arrow.jpeg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
// --------- BACK BUTTON --------------
// --------- ERRYTING ELSE ------------
          Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.1,
                ),
// --------- SPACING CONTROL --------------
// --------- AVATAR DON -------------------
                CircleAvatar(
                  radius: 80,
                  backgroundColor: orange,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage:
                        AssetImage("assets/images/avatars/parrot.jpeg"),
                  ),
                ),
// --------- AVATAR DON -------------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.05,
                ),
// --------- SPACING CONTROL --------------
// --------- WELCOME TEXT -----------------
                Center(
                  child: Container(
                    child: Text(
                      'Hello, Sam',
                      style: TextStyle(
                        //fontFamily: 'Museo',
                        fontSize: height * 0.08,
                        color: blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
// --------- WELCOME TEXT -----------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.05,
                ),
// --------- SPACING CONTROL --------------
// --------- START BUTTON -----------------
                Container(
                  width: width * 0.75,
                  height: height * 0.2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //TODO: Change this to Select Exercise page once it has navigation to select music
                          builder: (context) => SelectExercise(),
                        ),
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: orange,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Start!',
                            style: TextStyle(
                              color: white,
                              //fontFamily: 'Museo',
                              fontSize: 50,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
// --------- START BUTTON -----------------
                SizedBox(
                  height: height * 0.04,
                ),
// --------- SPACING CONTROL --------------
// --------- MY ADMIN BUTTON --------------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddAdmin(),
                        ),
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: white,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'My Admin',
                            style: TextStyle(
                              color: green,
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


// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.04,
                ),
// --------- SPACING CONTROL --------------
// --------- SETTINGS BUTTON --------------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: white,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              color: green,
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
// --------- SETTINGS BUTTON --------------
              ])
        ],
      ),
    );
  }
}
