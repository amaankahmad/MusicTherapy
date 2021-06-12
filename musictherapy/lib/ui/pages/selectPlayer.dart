import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SelectPlayer extends StatefulWidget {
  @override
  _SelectPlayerState createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
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
    final cUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: honeydew,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
//----------------------------
// Home button
              Positioned(
                top: 30,
                right: 20,
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
                      shadowColor: blue,
                      color: white,
                      elevation: 5,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 12,
                            right: 12,
                            bottom: 12,
                          ),
                          child: Image.asset(
                            'assets/images/navigation/home.png',
                            color: blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
//---------------------------------
//Back button
              Positioned(
                top: 30,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => AdminStartPage(),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Spacing above 'Select Player'
                  SizedBox(
                    height: height * 0.01,
                  ),

//-----------------------------------
// Text for 'Select Player
                  Text(
                    'Select\nPlayer',
                    style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.05,
                      color: blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
//-----------------------------------
// Container -> Stack -> Center -> Column
                  Container(
                    height: height * 0.7,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF2),
                        //Container color
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: Stack(
                      children: [
                        Center(
                          //child: SingleChildScrollView(
                          child: Column(
//---------------------------------------
// Padding + SizedBox + Container + SizedBox
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), //Rounded edges for card of 'Player list
                                  ),
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: height * 0.025),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                //Sets padding around 'Player list'
                                child: Container(
                                  width: 0.8 * width,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3.0,
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      //Text&font:'Leg Exercises'
                                      'Connected Players',
                                      style: TextStyle(
                                          fontSize: height * 0.035,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                //Creates gap between Player list and Table
                                height: 5,
                              ),
                              Container(
                                height: height * 0.4,
                                // child: GridView.count(
                                //   //Creates grid
                                //   padding: const EdgeInsets.all(
                                //       20), //Padding for grid
                                //   crossAxisSpacing: width *
                                //       0.024, //Sets horizontal spacing between each circle
                                //   mainAxisSpacing: height *
                                //       0.02, //Sets vertical spacing between each circle
                                //   crossAxisCount:
                                //       2, //Sets how many units for width of grid
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('admin_players')
                                        .doc(cUser.uid)
                                        .collection('PlayerList')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      return SizedBox(
                                        height: height * 0.4,
                                        child: ListView(
                                          children: snapshot.data.docs
                                              .map((document) {
                                            return Center(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 5,
                                                      ),
                                                      child:
                                                          //button
                                                          Container(
                                                              height:
                                                                  height * 0.1,
                                                              width:
                                                                  width * 0.7,
                                                              child:
                                                                  RaisedButton(
                                                                onPressed:
                                                                    () {}, //Function of the button when press
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                                child: Text(
                                                                    document[
                                                                        'player'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Museo',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          height *
                                                                              0.025,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    )),
                                                              )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }),

                                // List.generate(18, (int index) {
                                //   //generated 18 circles
                                //   return Column(
                                //     //Column so that can contain circle and text
                                //     crossAxisAlignment: CrossAxisAlignment
                                //         .center, //Centered both items
                                //     children: [
                                //       FlatButton(
                                //         onPressed: () {},
                                //         child: Container(
                                //           width: height * 0.14,
                                //           height: height * 0.14,
                                //           decoration: BoxDecoration(
                                //             shape: BoxShape.circle,
                                //             border: Border.all(
                                //                 color: orange, width: 12.0),
                                //           ),
                                //           child: ClipOval(
                                //             child: Padding(
                                //               padding:
                                //                   const EdgeInsets.all(4.0),
                                //               child: Image.asset(
                                //                   "assets/images/avatars/lion.png"),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: height * 0.01,
                                //       ),
                                //       Text(
                                //         'User ${index + 1}',
                                //         style: TextStyle(
                                //           color: const Color(0xFF1E325C),
                                //           fontWeight: FontWeight.bold,
                                //           fontFamily: 'Museo',
                                //           fontSize: height * 0.024,
                                //         ),
                                //       ),
                                //     ],
                                //   );
                                // }),
                              ),
                              //),
                              SizedBox(
                                height: height *
                                    0.1, //Creates space at bottom of grid
                              ),
                            ],
                          ),
                          //),
                        ),
                      ],
                    ),
                  ),
//--------------------------------------
// Flat button for 'Add another player'
                  /*FlatButton(
                    onPressed:
                        () {}, //Fill in to make button functional when pressed
                    child: Card(
                      elevation: 3,
                      //Creates orange card at the bottom
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                          horizontal: width * 0.05), //Sets margins for card
                      color: yellow,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ Add another player',
                              style: TextStyle(
                                fontFamily: 'Museo',
                                color: Colors.white,
                                fontSize: height * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
