//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';

class AddAdmin extends StatefulWidget {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final cUser = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  String cUsername;
  String adminUsername;
  String adminUid;
  var validAdmin = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Admin Username'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please enter an existing Admin Username.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFBF2),
        body: Stack(
          children: [
            //------------------------
            //Back button
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
                        builder: (context) => PlayerStartPage(),
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
            //------------------------
            //Home button
            /*Positioned(
              top: 60,
              right: 40,
              child: Container(
                width: 50,
                height: 50,
                //margin: EdgeInsets.only(right: 350),
                child: Material(
                  borderRadius: BorderRadius.circular(10000),
                  shadowColor: Colors.blue,
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
            ),*/
            Center(
              child: Column(children: <Widget>[
                //------------------------
                //Spacing
                SizedBox(
                  height: height * 0.08,
                ),
                //------------------------
                //Title text&font: 'Connect to an Admin'
                Text(
                  'Connect to\nan Admin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.06,
                    color: const Color(0xFF1E325C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                //------------------------
                //"Enter Username of Admin"
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.3,
                      ),
                      Container(
                        width: width * 0.8,
                        child: TextField(
                          onChanged: (adminUname) {
                            setState(() {
                              adminUsername = adminUname.trim();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter Admin Username:',
                            labelStyle: TextStyle(
                              fontSize: height * 0.03,
                              color: orange,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: orange,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                //------------------------
                //Spacing
                SizedBox(
                  height: height * 0.2,
                ),
                //----------------------
                //Button: Send Request
                Container(
                  margin: EdgeInsets.all(30),
                  height: 120,
                  width: width * 0.8,
                  child: GestureDetector(
                    onTap: () {
                      requestAdmin();
                      //if (adminUid != null) {
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Colors.grey[300],
                      color: const Color(0xFFFFC247),
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Send Request',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  requestAdmin() async {
    //get uid of admin
    await _firestore
        .collection("username_uid")
        .doc(adminUsername)
        .get()
        .then((value) {
      adminUid = value.data()["UID"];
    });
    //check if the Admin username entered is valid
    await _firestore.collection("user_info").doc(adminUid).get().then((value) {
      if (value.data()["admin"] == true && adminUid != null) {
        validAdmin = true;
        //get the username of the player
        _firestore.collection("user_info").doc(cUser.uid).get().then((result) {
          cUsername = result.data()["username"];
          //add player to admin's player list
          _firestore
              .collection("admin_players")
              .doc(adminUid)
              .collection("PlayerList")
              .doc(cUser.uid)
              .set({"player": cUsername});
          //save admin as player's myAdmin
          _firestore
              .collection("player_admin")
              .doc(cUser.uid)
              .set({"myAdmin": adminUid});
        });

        // _firestore
        //     .collection("admin_players")
        //     .doc(adminUid)
        //     .collection("PlayerList")
        //     .doc(cUser.uid)
        //     .get()
        //     .then((DocumentSnapshot documentSnapshot) {
        //   if (documentSnapshot.exists) {
        //   } else {
        //     _firestore
        //         .collection("admin_players")
        //         .doc(adminUid)
        //         .collection("PlayerList")
        //         .doc(cUser.uid)
        //         .set({"PlayerList": {}});
        //   }
        // });
        // _firestore.collection("admin_players").doc(adminUid).update({
        //   "PlayerList": FieldValue.arrayUnion([cUsername])
        // });

      }
    });
    if (validAdmin == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlayerStartPage(),
        ),
      );
    } else {
      _showMyDialog();
    }
  }
}
