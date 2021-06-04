//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  SelectExerciseState();

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
          Stack(
        children: [
          //------------------------
          //Back button
          Container(
            margin: EdgeInsets.only(top: 60, left: 40),
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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //------------------------
                      //Spacing above 'Select Exercise'
                      SizedBox(
                        height: height * 0.08,
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
                          height: height * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          //Scrolling area contents
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics (),
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
                                      //Text&font:'Arm Exercises'
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
                                /*
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: privExPreviews.length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return privExPreviews[index];
                                    },
                                  ),
                                ),
                                */
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
                                StreamBuilder(
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
                                                width: MediaQuery.of(context).size.width / 1.2,
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
                                                              height: height * 0.1,
                                                              width: width * 0.7,
                                                              child: RaisedButton(
                                                                onPressed: () {}, //Function of the button when press
                                                                color: Colors.white,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                ),
                                                                child: Text(document['name'],
                                                                    style: TextStyle(
                                                                      fontFamily: 'Museo',
                                                                      color: Colors.black,
                                                                      fontSize: height * 0.025,
                                                                      fontWeight: FontWeight.bold,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
