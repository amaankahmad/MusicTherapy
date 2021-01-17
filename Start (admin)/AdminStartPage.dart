//sambo slicy
//updated jan 16th

import 'package:flutter/material.dart';

class AdminStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final honeydew = const Color(0xFFF1FAEE);
    return Scaffold(
      backgroundColor: honeydew,
      body: Stack(
        children: <Widget>[
// --------- BACK BUTTON --------------
          Positioned(
            top: 15,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: const Color(0xFF1E325C),
                elevation: 5,
                child: GestureDetector(
                  onTap: () {},
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset('assets/images/arrow.jpeg',),
                    ),
                  ),
                ),
              ),
            ),
          ),
// --------- BACK BUTTON --------------
// --------- ERRYTING ELSE ------------
          Column(
              children: <Widget>[
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.12,
                ),
// --------- SPACING CONTROL --------------
// --------- AVATAR DON -------------------
                CircleAvatar(
                  radius: 80,
                  backgroundColor: orange,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("assets/images/parrot.jpg"),
                  ),
                ),
// --------- AVATAR DON -------------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.03,
                ),
// --------- SPACING CONTROL --------------
// --------- WELCOME TEXT -----------------
                Center(
                  child: Container(
                    child: Text(
                      'admin mode',
                      style: TextStyle(
                        //fontFamily: 'Museo',
                        fontSize: height * 0.06,
                        color: blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
// --------- WELCOME TEXT -----------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.13,
                ),
// --------- SPACING CONTROL --------------
// --------- CREATE EXERCISES BUTTON ------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: orange,
                    color: orange,
                    elevation: 3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Create Exercises',
                            style: TextStyle(
                              color: white,
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
// --------- CREATE EXERCISES BUTTON ------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.04,
                ),
// --------- SPACING CONTROL --------------
// --------- MANAGE PLAYERS BUTTON --------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: orange,
                    color: orange,
                    elevation: 3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Manage Players',
                            style: TextStyle(
                              color: white,
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
// --------- MANAGE PLAYERS BUTTON --------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.04,
                ),
// --------- SPACING CONTROL --------------
// --------- SETTINGS BUTTON --------------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: orange,
                    color: white,
                    elevation: 3,
                    child: GestureDetector(
                      onTap: () {},
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

              ]
          )
        ],
      ),
    );
  }
}

