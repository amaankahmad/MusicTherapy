import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  var state = false;
  var switchColor = Colors.red[900];
  var _currentVolume = 60.0;
  var _currentFeedbackVolume = 80.0;
  final auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final cUser = FirebaseAuth.instance.currentUser;
  String _newUsername;
  var uname_exists = false;
  int _currentAvatarIndex = 0;

  CollectionReference users = FirebaseFirestore.instance.collection('user_info');

    void getUserInfo() async {
    _firestore.collection("user_info").doc(cUser.uid).get().then((value) {
      setState(() {
     _currentAvatarIndex  = value.data()["avatar"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
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
    final sectionBoxSize = width * 0.8;
    

//alterDialog of username
        Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Username already exists'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Please choose a different username.'),
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

////alterDialog of save conformation

        Future<void> _save() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update saved'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('：）'),
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
// change username
    Future<void> changeUsername() {
  return users
    .doc(cUser.uid)
    .update({'username': _newUsername})
    .then((value) => _save())
    .catchError((error) => print("Failed to update: $error"));
}

//change avatar

    Future<void> changeAvatar() {
  return users
    .doc(cUser.uid)
    .update({'avatar' : _currentAvatarIndex})
    .then((value) => _save())
    .catchError((error) => print("Failed to update: $error"));
}

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
//-----------------------------------
// Back Button:
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => PlayerStartPage(),
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10000),
                  shadowColor: orange,
                  color: Colors.white,
                  elevation: 3,
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 12,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset(
                        "assets/images/navigation/arrow.jpeg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
//-----------------------------------
// Device Connectivity:
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: 40,
              right: 40,
              bottom: 40,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: sectionBoxSize,
                    decoration: BoxDecoration(
                      color: Colors.orange[600],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 6,
                        bottom: 6,
                      ),
                      child: Text(
                        'Device connectivity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40),
                    child: Column(
                      children: <Widget>[
//-----------------------------------
// Bluetooth:
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Bluetooth',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: switchColor,
                              ),
// Toggle Switch
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                ),
                                child: Transform.scale(
                                  scale: 2,
                                  child: new Switch(
                                    activeColor: Colors.white,
                                    value: state,
                                    onChanged: (bool s) {
                                      setState(() {
                                        state = s;
                                        if (s) {
                                          switchColor = green;
                                        } else {
                                          switchColor = Colors.red[900];
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
//-----------------------------------
// Devices Section:
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Devices:',
                            style: TextStyle(
                              color: blue,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    child: Image.asset(
                                      'assets/images/navigation/right.png',
                                      color: blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Wearable 1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Icon(
                                    Icons.check_sharp,
                                    color: green,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    child: Image.asset(
                                      'assets/images/navigation/right.png',
                                      color: blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Wearable 2',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
//-----------------------------------
// Audio settings:
                 /* Container(
                    width: sectionBoxSize,
                    decoration: BoxDecoration(
                      color: Colors.orange[600],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 6,
                        bottom: 6,
                      ),
                      child: Text(
                        'Audio settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),*/
                  Column(
                    children: <Widget>[
//-----------------------------------
/*// Volume of Music:
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 40,
                        ),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Volume of music',
                            style: TextStyle(
                              color: blue,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.16,
                      ),
                      Row(
                        children: <Widget>[
                          Transform.scale(
                            scale: 1.5,
                            child: Icon(Icons.volume_up),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                              ),
                              child: Transform.scale(
                                scale: 1.5,
                                child: new Slider(
                                  value: _currentVolume,
                                  min: 0,
                                  max: 100,
                                  activeColor: orange,
                                  divisions: 100,
                                  onChanged: (double volume) {
                                    setState(() {
                                      _currentVolume = volume;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
//-----------------------------------
// Volume of Feedback:
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 40,
                        ),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Volume of feedback',
                            style: TextStyle(
                              color: blue,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.16,
                      ),
                      Row(
                        children: <Widget>[
                          Transform.scale(
                            scale: 1.5,
                            child: Icon(Icons.volume_up),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                              ),
                              child: Transform.scale(
                                scale: 1.5,
                                child: new Slider(
                                  value: _currentFeedbackVolume,
                                  min: 0,
                                  max: 100,
                                  activeColor: orange,
                                  divisions: 100,
                                  onChanged: (double feedVolume) {
                                    setState(() {
                                      _currentFeedbackVolume = feedVolume;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),*/
//-----------------------------------
// Account settings:
                      Container(
                        width: sectionBoxSize,
                        decoration: BoxDecoration(
                          color: Colors.orange[600],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 6,
                            bottom: 6,
                          ),
                          child: Text(
                            'Account settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
//-----------------------------------
// Avatar Selection:
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Text(
                              'Change avatar:',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                // Left Arrow
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("Left");

                      if (_currentAvatarIndex == 0) {
                        setState(() {
                          _currentAvatarIndex = 10;
                          print(_currentAvatarIndex);
                        });
                      } else {
                        setState(() {
                          _currentAvatarIndex--;
                        });
                        print(_currentAvatarIndex);
                      }
                      ;
                    },
                    child: Container(
                      width: 20,
                      child: Image.asset(
                        'assets/images/navigation/left.png',
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Image, TODO: ADD FUNCTIONALITY
                  Center(
                    child: Container(
                      width: height * 0.2,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: orange, width: 12.0),
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/avatars/$_currentAvatarIndex.jpeg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Right Arrow
                  GestureDetector(
                    onTap: () {
                      print("Right");

                      if (_currentAvatarIndex == 10) {
                        setState(() {
                          _currentAvatarIndex = 0;
                          print(_currentAvatarIndex);
                        });
                      } else {
                        setState(() {
                          _currentAvatarIndex++;
                        });
                        print(_currentAvatarIndex);
                      };                      ;
                    },
                    child: Container(
                      width: 25,
                      child: Image.asset(
                        'assets/images/navigation/right.png',
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
                          ),
//-----------------------------------
// Spacing for Text Fields:
                          SizedBox(
                            height: 25,
                          ),
//-----------------------------------
//  Username Text Field:
                          Container(
                            child: Text(
                              'Change username:',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                              onChanged: (username) {
                         setState(() {
                          _newUsername = username.trim();
                        });
                      },
                                  decoration: InputDecoration(
                                    labelText: 'new username',
                                    labelStyle: TextStyle(
                                      //fontFamily: 'Museo',
                                      fontSize: 18,
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
/*
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'password',
                                    labelStyle: TextStyle(
                                      //fontFamily: 'Museo',
                                      fontSize: 18,
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
                                  obscureText: true,
                                ),
                                */
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
//-----------------------------------
//  Sign Up Button:
                          Container(
                            width: width * 0.6,
                            child: GestureDetector(
                              onTap: () async {
                            //check username
                          final result = await _firestore
                              .collection('user_info')
                              .where("username", isEqualTo: _newUsername)
                              .get();
                          result.docs.forEach((res) {
                            uname_exists = true;
                          });
                          print(uname_exists);

                          //if new username is unique
                          if (uname_exists == false) {

                          //update username and avatar
                          changeAvatar();
                          changeUsername();
                          }
                          //if username exists
                          else {
                            print('Username exists');
                            _showMyDialog();
                          }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(40),
                                shadowColor: blue,
                                color: green,
                                elevation: 3,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        color: white,
                                        //fontFamily: 'Museo',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
