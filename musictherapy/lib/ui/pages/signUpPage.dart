import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/privacyPolicy.dart';
import 'package:musictherapy/ui/pages/settings.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/terms&Conditions.dart';

// Widget
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// State of Widget
class _SignUpState extends State<SignUp> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  bool _checkPlayer = false;
  bool _checkAdmin = false;
  bool _checkTC = false;
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
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: orange,
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
                height: height * 0.12,
              ),
              Row(
                // Left Arrow
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 30,
                    child: Image.asset(
                      'assets/images/navigation/left.png',
                      color: Colors.orange[700],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Image, TODO: ADD FUNCTIONALITY
                  Center(
                    child: Container(
                      width: 225,
                      height: 225,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: orange, width: 12.0),
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/avatars/lion.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Right Arrow
                  Container(
                    width: 30,
                    child: Image.asset(
                      'assets/images/navigation/right.png',
                      color: Colors.orange[700],
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
                            });
                          },
                          activeColor: green,
                          checkColor: white,
                        ),
                      ],
                    ),
//-----------------------------------
//  Password Text Fields:
                    TextField(
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
                      obscureText: true,
                    ),
                    TextField(
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
                      obscureText: true,
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
                          width: width * 0.1,
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
                        'I have read and I agree to the Terms and Conditions. \n Learn how we process your data in Privacy Policy',
                        style: TextStyle(
                          color: blue,
                          fontSize: 10,
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
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: orange,
                        color: green,
                        elevation: 3,
                        child: GestureDetector(
                          onTap: () {
                            auth
                                .createUserWithEmailAndPassword(
                                    email: _email, password: _password)
                                .then((_) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => AdminStartPage(),
                                ),
                              );
                            });
                          },
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
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
