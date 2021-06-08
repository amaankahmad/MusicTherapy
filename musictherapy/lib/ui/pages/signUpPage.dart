import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';
import 'package:musictherapy/ui/pages/privacyPolicy.dart';
import 'package:musictherapy/ui/pages/settings.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/terms&Conditions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Widget
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// State of Widget
class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState.validate()) {
      print("validated");
    } else {
      print("Not validated");
    }
  }

  String _email, _password, _password2, _username;
  /* TextEditingController _password1 = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();*/

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  bool _checkPlayer = false;
  bool _checkAdmin = false;
  bool _checkTC = false;
  //bool uniqueUsername = true;
  //int vaild = 0;
  var uname_exists = false;

  int _currentAvatarIndex = 0;

  // Avatar image selection

 /* switch (_currentAvatarIndex) {
    case 0:
      Image.asset("assets/images/avatars/lion.png");
  break;

  case 1:
  Image.asset("assets/images/avatars/cat.png");
  break;

  }*/

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

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
//-----------------------------------
// Back Button:
              Positioned(
                top: 30,
                left: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(10000),
                      shadowColor: orange,
                      elevation: 3,
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
//-----------------------------------
// Avatar Selection:
              Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.05,
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
                          };                     
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
                    height: 10,
                  ),
//-----------------------------------
//  Email Text Field:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            setState(() {
                              _email = email.trim();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'email',
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
//-----------------------------------
//user name text field

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (username) {
                            setState(() {
                              _username = username.trim();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'username',
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
                          validator: (uname_exists) {
                            if (uname_exists == true) {
                              return "Username already in use";
                            } else {
                              return null;
                            }
                          },
                        ),

//_________________________________
// Spacing for Select Role:
                        SizedBox(
                          height: 20,
                        ),
//-----------------------------------
//  Select Role:
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Select role:',
                                    style: TextStyle(
                                      color: blue,
                                      //fontFamily: 'Museo',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CheckboxListTile(
                              title: Text(
                                'Player',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _checkPlayer,
                              onChanged: (value) {
                                setState(() {
                                  _checkPlayer = value;
                                  _checkAdmin = false;
                                });
                              },
                              activeColor: green,
                              checkColor: white,
                            ),
                            CheckboxListTile(
                              title: Text(
                                'Admin',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _checkAdmin,
                              onChanged: (value) {
                                setState(() {
                                  _checkAdmin = value;
                                  _checkPlayer = false;
                                });
                              },
                              activeColor: green,
                              checkColor: white,
                            ),
                          ],
                        ),
//-----------------------------------
//  Password Text Fields:

                        Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (password) {
                                  setState(() {
                                    _password = password.trim();
                                  });
                                },
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
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Password Required";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                              ),
                              TextFormField(
                                onChanged: (password) {
                                  setState(() {
                                    _password2 = password.trim();
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'confirm password',
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
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Confirm Password Required";
                                  } else if (_password != _password2) {
                                    return "The passwords do not match";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),

//-----------------------------------
//  Spacing for Terms and Conditions:
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment(1, 0),
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TermsAndConditions(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                    color: orange,
                                    //fontFamily: 'Museo',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor: orange,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Container(
                              alignment: Alignment(1, 0),
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: orange,
                                    //fontFamily: 'Museo',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor: orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
//-----------------------------------
//  Check Terms and Conditions:
                        CheckboxListTile(
                          title: Text(
                            'I have read and agree to the Terms and Conditions.\nLearn how we process your data in Privacy Policy',
                            style: TextStyle(
                              color: blue,
                              fontSize: 14,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _checkTC,
                          onChanged: (value) {
                            setState(() {
                              _checkTC = value;
                            });
                          },
                          activeColor: green,
                          checkColor: white,
                        ),
//-----------------------------------
//  Spacing for Button:
                        SizedBox(
                          height: 20,
                        ),
//-----------------------------------
//  Sign Up Button:
                        Container(
                          width: width * 0.6,
                          child: GestureDetector(
                            onTap: () async {
                              validate();

                              //check username
                              final result = await FirebaseFirestore.instance
                                  .collection('user_info')
                                  .where("username", isEqualTo: _username)
                                  .get();
                              result.docs.forEach((res) {
                                uname_exists = true;
                              });
                              print('Some text');
                              print(uname_exists);

                              //if user name is unique
                              if (uname_exists == false) {
                                /* var unexists = false;
                              var result = await FirebaseFirestore.instance
                              firestore.collection("user_info").where("username", isEqualTo: _username).get();*/
                                await auth.createUserWithEmailAndPassword(
                                    email: _email, password: _password);

                                auth.signInWithEmailAndPassword(
                                    email: _email, password: _password);

                                var cUser = FirebaseAuth.instance.currentUser;
                                firestore
                                    .collection('user_info')
                                    .doc(cUser.uid)
                                    .set({
                                  'admin': _checkAdmin,
                                  'player': _checkPlayer,
                                  'email': _email,
                                  'username': _username,
                                  'avatar' : _currentAvatarIndex,
                                });
                                firestore
                                    .collection('username_uid')
                                    .doc(_username)
                                    .set({
                                  'UID': cUser.uid,
                                });
                                firestore
                                    .collection("user_roles")
                                    .doc(cUser.uid)
                                    .get()
                                    .then((value) {
                                  if (value.data()["player"] == true) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => PlayerStartPage(),
                                      ),
                                    );
                                  } else if (value.data()["admin"] == true) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => AdminStartPage(),
                                      ),
                                    );
                                  }
                                });

                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              }
                              //if username exists
                              else {
                                print('Username exists');
                                _showMyDialog();
                              }
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(40),
                              shadowColor: orange,
                              color: green,
                              elevation: 3,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'Sign Up!',
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
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],

              ),

            ],

          ),

        ),
      ),
    );
  }
}
