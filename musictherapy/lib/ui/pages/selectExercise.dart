//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:musictherapy/ui/pages/selectMusic.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/DisplayVideoPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SelectExercise extends StatefulWidget {
  @override
  SelectExerciseState createState() => SelectExerciseState();
}

class SelectExerciseState extends State<SelectExercise> {
  final cUser = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  var now;
  String adminUid;
  //var adminExists;

  void getMyAdmin() async {
    //get uid of admin
    _firestore
        .collection("player_admin")
        .doc(cUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          adminUid = documentSnapshot.data()["myAdmin"];
        });
      } else {
        setState(() {
          adminUid = "noAdminConnected";
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getMyAdmin();
    //print(adminUid);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final green = const Color(0xFF04A489);
    final yellow = const Color(0xFFFFC247);
    final honeydew = const Color(0xFFF1FAEE);
    final orange = const Color(0xFFF57E00);

    return Scaffold(
      floatingActionButton: null,
      backgroundColor: const Color(0xFFFFFBF2),
      body:
//-----------------------------------------
          SafeArea(
        child: Stack(
          children: [
            //------------------------
            //Back button
            Container(
              margin: EdgeInsets.only(top: 30, left: 40),
              width: 50,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: blue,
                color: white,
                elevation: 3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 12,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset('assets/images/navigation/arrow.jpeg'),
                    ),
                  ),
                ),
              ),
            ),
            //------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //------------------------
                      //Spacing above 'Select Exercise'
                      SizedBox(
                        height: height * 0.03,
                      ),
                      //------------------------
                      //Title text&font: 'Select Exercise'
                      Text(
                        'Select\nExercise',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: height * 0.06,
                          color: const Color(0xFF1E325C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      //------------------------
                      //Scrolling area
                      Center(
                        child: Container(
                          //Scrolling area background
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          height: height * 0.66,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          //Scrolling area contents
                          //child: SingleChildScrollView(
                          //physics: BouncingScrollPhysics (),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //------------------------
                              //Search bar
                              Container(
                                width: width * 0.8,
                                height: height * 0.045,
                                margin: EdgeInsets.all(15.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: blue, fontSize: height * 0.025),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.all(height * 0.001),
                                    hintText: 'Search',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                    ),
                                  ),
                                ),
                              ),
                              //------------------------
                              //'My Exercises' Bar
                              Container(
                                width: 0.8 * width,
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    'My Exercises',
                                    style: TextStyle(
                                        fontSize: height * 0.035,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              //------------------------
                              //My Exercise list
                              Expanded(
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('exercises_info')
                                        .doc('PrivateExercises')
                                        .collection(adminUid)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return SizedBox(
                                        height: height * 0.6,
                                        child: ListView(
                                          children: snapshot.data.docs
                                              .map((document) {
                                            return Center(
                                              child: Container(
                                                width: width * 0.7,
                                                // MediaQuery.of(context)
                                                //         .size
                                                //         .width /
                                                //     1.2,
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
                                                                onPressed: () {
                                                                  Navigator.of(context).push(
                                                                      MaterialPageRoute(
                                                                          builder: (context) => SelectMusic(),
                                                                      ));
                                                                  now = DateTime
                                                                      .now();
                                                                  String
                                                                      formattedTime =
                                                                      DateFormat(
                                                                              'yyyy-MM-dd – kk:mm')
                                                                          .format(
                                                                              now);
                                                                  _firestore
                                                                      .collection(
                                                                          "play_history")
                                                                      .doc(cUser
                                                                          .uid)
                                                                      .set({
                                                                    formattedTime:
                                                                        {
                                                                      "Exercise":
                                                                          document[
                                                                              'name'],
                                                                      "Status":
                                                                          "Started"
                                                                    },
                                                                  });
                                                                }, //Function of the button when press
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
                                                                        'name'],
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
                              ),
                              // //------------------------
                              // //'My Exercises' Bar
                              // Container(
                              //   width: 0.8 * width,
                              //   margin: EdgeInsets.all(8.0),
                              //   decoration: BoxDecoration(
                              //       color: orange,
                              //       borderRadius: BorderRadius.circular(40)),
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //       vertical: 3.0,
                              //       horizontal: 20,
                              //     ),
                              //     child: Text(
                              //       //Text&font:'Arm Exercises'
                              //       'My Exercises',
                              //       style: TextStyle(
                              //           fontSize: height * 0.035,
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              // ),
                              //------------------------
                              //'Public Exercises' Bar
                              Container(
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
                                    'Public Exercises',
                                    style: TextStyle(
                                        fontSize: height * 0.035,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              //------------------------
                              //Public Exercise list
                              Expanded(
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('exercises_info')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      return SizedBox(
                                        height: height * 0.6,
                                        child: ListView(
                                          children: snapshot.data.docs
                                              .map((document) {
                                            return Center(
                                              child: Container(
                                                width: width * 0.7,
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
                                                                onPressed: () {
                                                                  Navigator.of(context).push(
                                                                      MaterialPageRoute(
                                                                        builder: (context) => SelectMusic(),
                                                                      ));
                                                                  now = DateTime
                                                                      .now();
                                                                  String
                                                                      formattedTime =
                                                                      DateFormat(
                                                                              'yyyy-MM-dd – kk:mm')
                                                                          .format(
                                                                              now);
                                                                  _firestore
                                                                      .collection(
                                                                          "play_history")
                                                                      .doc(cUser
                                                                          .uid)
                                                                      .set({
                                                                    formattedTime:
                                                                        {
                                                                      "Exercise":
                                                                          document[
                                                                              'name'],
                                                                      "Status":
                                                                          "Started"
                                                                    },
                                                                  });
                                                                },
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
                                                                        'name'],
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
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                            ],
                          ),
                          //),
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
    );
  }

  saveSelection() async {}
}
