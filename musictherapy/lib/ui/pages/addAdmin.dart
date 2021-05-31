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
  var cUsername;
  var adminUsername;
  var adminUid;

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
                //"Enter Username of Admin"
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          onChanged: (adminUname) {
                            setState(() {
                              adminUsername = adminUname.trim();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter Admin Username:',
                            labelStyle: TextStyle(
                              fontSize: 25,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlayerStartPage(),
                        ),
                      );
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
    _firestore
        .collection("username_uid")
        .doc(adminUsername)
        .get()
        .then((value) {
      //adminUid = value.data()["UID"];
      //get the username of the player
      _firestore.collection("user_info").doc(cUser.uid).get().then((result) {
        //cUsername = result.data()["username"];
        //add player to admin's players list
        _firestore.collection("admin_players").doc(value.data()["UID"]).update({
          "PlayerList": FieldValue.arrayUnion([result.data()["username"]])
        });
        //save admin as player's myAdmin
        _firestore
            .collection("player_admin")
            .doc(cUser.uid)
            .set({"myAdmin": value.data()["UID"]});
      });
    });
  }
}
