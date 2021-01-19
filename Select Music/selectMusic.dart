import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SelectMusic extends StatefulWidget {
  @override
  _SelectMusicState createState() => _SelectMusicState();
}

class _SelectMusicState extends State<SelectMusic> {
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
    final List<String> entriesone = <String>[
      'Can-Can',
      'When the Saints go Marching'
    ];
    final List<String> entriestwo = <String>['Auld Lang Syne', '...'];
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
                    shadowColor: const Color(0xFF1E325C),
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
                            color: const Color(0xFF1E325C),
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
                          child: Image.asset(
                            "assets/images/arrow.jpeg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
//-------------------------------
// Column -> Text + Flat button for Random
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        'Select Music',
                        style: TextStyle(
                            color: blue,
                            fontFamily: 'Museo',
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.07),
                      ),
                      FlatButton(
                        onPressed:
                            () {}, //Fill in to make button functional when pressed
                        child: Card(
                          elevation: 3,
                          //Creates orange card at the bottom
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                                  width * 0.050), //Sets margins for card
                          color: green,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Random!',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: Colors.white,
                                    fontSize: height * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Icon(
                                  Icons.shuffle,
                                  color: Colors.white,
                                  size: height * 0.04,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
//-------------------------------
// Container -> Stack -> Center -> Column
                  Container(
                    height: height * 0.6,
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
//--------------------------------------------
// Text + Card + Container (both song names) x2
                            child: Column(
                              children: [
                                Text(
                                  'Find a Song!',
                                  style: TextStyle(
                                      color: const Color(0xFF1E325C),
                                      fontFamily: 'Museo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.05),
                                ),
                                Card(
                                  elevation: 3,
                                  color: orange,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        32.0), // Rounded edges for card
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 40),
                                    child: Text(
                                      'Upbeat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Museo',
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.045),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.15,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        elevation: 3,
                                        color: const Color(0xFF04A489),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          // Rounded edges for card
                                        ),
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              '${entriesone[index]}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Museo',
                                                  fontSize: height * 0.026,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                  ),
                                ),
                                Card(
                                  elevation: 3,
                                  color: yellow,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        32.0), // Rounded edges for card
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 35),
                                    child: Text(
                                      'Relaxing',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Museo',
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.045),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.15,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        elevation: 3,
                                        color: const Color(0xFF04A489),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          // Rounded edges for card
                                        ),
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              '${entriestwo[index]}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Museo',
                                                  fontSize: height * 0.026,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
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
      ),
    );
  }
}
