import 'package:flutter/material.dart';

class DisplayVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF57E00);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final yellow = const Color(0xFFFFC247);
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
                onTap: () {},
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.1,
                ),
// --------- SPACING CONTROL --------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.1,
                ),
// --------- SPACING CONTROL --------------
// --------- VIDEO CONTAINER --------------
                Center(
                  child: Container(
                    width: width * 0.75,
                    height: height * 0.3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: orange,
                        color: yellow,
                        elevation: 3,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Video',
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
                ),

// --------- VIDEO CONTAINER --------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.2,
                ),
// --------- SPACING CONTROL --------------
// --------- START BUTTON --------------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: orange,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Start',
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
// --------- START BUTTON --------------
// --------- SPACING CONTROL --------------
                SizedBox(
                  height: height * 0.04,
                ),
// --------- SPACING CONTROL --------------
// --------- REPLAY BUTTON --------------
                Container(
                  width: width * 0.75,
                  height: height * 0.1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: white,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'replay video',
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
// --------- REPLAY BUTTON --------------
              ]
          )
        ],
      ),
    );
  }
}

