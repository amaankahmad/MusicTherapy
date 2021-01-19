import 'package:flutter/material.dart';

class PlayerStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final white = const Color(0xFFFFFBF2);
    final honeydew = const Color(0xFFF1FAEE);
    final blue = const Color(0xFF1E325C);
    final yellow = const Color(0xFFFFC247);
    final orange = const Color(0xFFF57E00);
    final green = const Color(0xFF04A489);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Stack(
            children: [
              //-----------------------------------
// Home Button:
              Positioned(
                top: 15,
                right: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10000),
                    shadowColor: blue,
                    color: Colors.white,
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 12,
                            right: 12,
                            bottom: 12,
                          ),
                          child: Image.asset(
                            "assets/images/home.png",
                            color: blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
//-----------------------------------
// Back Button:
              Positioned(
                top: 15,
                left: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10000),
                    shadowColor: blue,
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
                          child: Image.asset(
                            "assets/images/arrow.jpeg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
//---------------------------------------
// Center -> Column
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
//----------------------------------------
// Sized Box
                    SizedBox(
                      height: height * 0.04,
                    ),
// Text for 'Player Statistics'
                    Text(
                      'Player Statistics',
                      style: TextStyle(
                        fontFamily: 'Museo',
                        fontSize: height * 0.06,
                        color: blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
//--------------------------------------
// Column -> Center
                    Column(
                      children: <Widget>[
                        Center(
//---------------------------------------
// Container for player avatar
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: orange, width: 12.0),
                            ),
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/images/lion.png"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
//-------------------------------------------
// Container for 'Performance Statistics' + list + 'Current Exercises' + list
                        Container(
                          height: height * 0.5,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              color: honeydew, //Container color
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Stack(
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 3,
                                        color: const Color(0xFFFFC247),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              32.0), // Rounded edges for card
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 20),
                                          child: Text(
                                            'Performance Statistics',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Museo',
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.032),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.15,
                                        child: ListView.separated(
                                          padding: const EdgeInsets.all(8),
                                          itemCount: 3,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              elevation: 3,
                                              color: white,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                // Rounded edges for card
                                              ),
                                              child: FlatButton(
                                                onPressed: () {},
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    '...',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Museo',
                                                        fontSize: height * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const Divider(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: const Color(0xFFFFC247),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              32.0), // Rounded edges for card
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 20),
                                          child: Text(
                                            'Current Exercises',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Museo',
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.032),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.15,
                                        child: ListView.separated(
                                          padding: const EdgeInsets.all(8),
                                          itemCount: 3,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              elevation: 3,
                                              color: white,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                // Rounded edges for card
                                              ),
                                              child: FlatButton(
                                                onPressed: () {},
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    '...',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Museo',
                                                        fontSize: height * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const Divider(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
