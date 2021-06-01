//import 'dart:html';

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
  var cUser = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  List<Widget> privExPreviews = [];
  List<Widget> pubExPreviews = [];

  //Get exercise list function
  getExerciseList() async {
    //Get private exercises
    List<dynamic> privExList = [];
    await _firestore.collection("player_admin").doc(cUser.uid).get().then((value) {
      final adminUID = value.data()["myAdmin"];
      _firestore
          .collection("exercises_info")
          .doc("PrivateExercises")
          .collection(adminUID)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          privExList.add(result.data()["name"]);
          List<Widget> privList = [];
          privExList.forEach((privEx) {
            privList.add(Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      privEx(),
                      style: const TextStyle(
                          fontSize: 25,
                          color: const Color(0xFF1E325C),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ));
          });
          setState(() {
            privExPreviews = privList;
          });
        });
      });
    });
    //Get public exercises
    List<dynamic> pubExList = [];
    _firestore.collection("exercises_info").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //List<dynamic> pubExList = result.data()["name"];
        pubExList.add(result.data()["name"]);
        List<Widget> pubList = [];
        pubExList.forEach((pubEx) {
          pubList.add(Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pubEx(),
                    style: const TextStyle(
                        fontSize: 25,
                        color: const Color(0xFF1E325C),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ));
          setState(() {
            pubExPreviews = pubList;
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getExerciseList();
  }

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
      //------------------------
      //Main Background
      backgroundColor: const Color(0xFFFFFBF2),
      body: Stack(
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
                        height: height * 0.05,
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
                      //------------------------
                      //Scrolling area
                      Center(
                        child: Container(
                          //Scrolling area background
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          height: height * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          //Scrolling area contents
                          child: Column(
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
                              Expanded(
                                child: ListView.builder(
                                  itemCount: privExPreviews.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return privExPreviews[index];
                                  },
                                ),
                              ),
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
                                child: ListView.builder(
                                  itemCount: pubExPreviews.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return pubExPreviews[index];
                                  },
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
          ),
        ],
      ),
    );
  }
}
//   final Size size = MediaQuery.of(context).size;
//   final double videoHeight = size.height*0.3;
//   return SafeArea(
//     child: Scaffold(
//       backgroundColor: const Color(0xFFF1FAEE),
//       body: Container(
//         height: size.height,
//         child:Column(children: <Widget>[
//           Row()
//         ],)
//       ),

//     )
//     );
//}
