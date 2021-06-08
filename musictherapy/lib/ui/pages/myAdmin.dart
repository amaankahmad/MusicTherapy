//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musictherapy/ui/pages/addAdmin.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';

class MyAdmin extends StatefulWidget {
  @override
  _MyAdminState createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {
  final cUser = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  String cUsername;
  String adminUsername;
  String adminUid;
  int _currentAvatarIndex = 0;

  void getPlayerInfo() async {
    _firestore.collection("user_info").doc(cUser.uid).get().then((value) {
      setState(() {
        cUsername = value.data()["username"];

      });
    });
  }

  void getMyAdmin() async {
    _firestore.collection("player_admin").doc(cUser.uid).get().then((value) {
      setState(() {
        adminUid = value.data()["myAdmin"];
        _firestore.collection("user_info").doc(adminUid).get().then((value) {
          setState(() {
            adminUsername = value.data()["username"];
            _currentAvatarIndex = value.data()["avatar"];
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPlayerInfo();
    getMyAdmin();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF57E00);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final yellow = const Color(0xFFFFC247);
    final honeydew = const Color(0xFFF1FAEE);

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Change my admin'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Are you sure you want to delete your admin connection?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('YES'),
                onPressed: () {
                  deleteAdmin();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddAdmin(),
                    ),
                  );
                },
              ),
              TextButton(
                child: const Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFBF2),
        body: SafeArea(
          child: Stack(
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

              Center(
                child: Column(children: <Widget>[
                  //Spacing
                  SizedBox(
                    height: height * 0.15,
                  ),
                  //----------------------
                  //------------------------
                  //Admin's Avatar
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: orange,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          AssetImage("assets/images/avatars/$_currentAvatarIndex.jpeg"),
                    ),
                  ),
                  //------------------------
                  //Spacing
                  SizedBox(
                    height: height * 0.05,
                  ),
                  //------------------------
                  //Admin's Username
                  Center(
                    child: Container(
                      child: Text(
                        'My Admin:\n$adminUsername',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Museo',
                          fontSize: height * 0.06,
                          color: blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  //------------------------
                  //Spacing
                  SizedBox(
                    height: height * 0.05,
                  ),
                  //----------------------
                  //Button: change my admin
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 120,
                    width: width * 0.8,
                    child: GestureDetector(
                      onTap: () {
                        _showMyDialog();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: Colors.grey[300],
                        color: yellow,
                        elevation: 3,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Change My Admin',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Museo',
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //------------------------
                  //Spacing
                  SizedBox(
                    height: height * 0.01,
                  ),
                  //----------------------
                  //Button: OK
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 200,
                    width: width * 0.8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlayerStartPage(),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: Colors.grey[300],
                        color: orange,
                        elevation: 3,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Museo',
                                fontSize: 50,
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
      ),
    );
  }

  deleteAdmin() async {
    //get player's admin uid
    await _firestore
        .collection("player_admin")
        .doc(cUser.uid)
        .get()
        .then((value) {
      adminUid = value.data()["myAdmin"];
    });
    //get the username of the player
    await _firestore
        .collection("user_info")
        .doc(cUser.uid)
        .get()
        .then((result) {
      cUsername = result.data()["username"];
    });
    //remove admin from player's "my admin"
    _firestore.collection("player_admin").doc(cUser.uid).delete();
    //remove player from admin's players list
    _firestore.collection("admin_players").doc(adminUid).update({
      "PlayerList": FieldValue.arrayRemove([cUsername])
    });
  }
}
