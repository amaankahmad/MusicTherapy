import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';

// Widget
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// State of Widget
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFF1FAEE);
    bool _checkPlayer = true;
    bool _checkAdmin = false;
    bool _checkTC = true;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
//-----------------------------------
// Home Button:
          Positioned(
            top: 60,
            right: 40,
            child: Container(
              width: 50,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: blue,
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
                        color: blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                shadowColor: blue,
                elevation: 5,
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
                        "assets/images/arrow.jpeg",
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
                      'assets/images/left.png',
                      color: Colors.orange[700],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Image, TODO: ADD FUNCTIONALITY
                  Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: orange, width: 12.0),
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("assets/images/lion.png"),
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
                      'assets/images/right.png',
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
                      height: 30,
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
                      height: 15,
                    ),
//-----------------------------------
//  Sign Up Button:
                    Container(
                      width: width * 0.6,
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: blue,
                        color: green,
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {},
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
