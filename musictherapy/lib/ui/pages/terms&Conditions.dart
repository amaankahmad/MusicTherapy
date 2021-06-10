import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/signUpPage.dart';

class TermsAndConditions extends StatelessWidget {
  String _email;
  final auth = FirebaseAuth.instance;

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
                      builder: (context) => SignUp(),
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
// Forgot Password:
          Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.175,
              ),
              Container(
                height: 0.08 * height,
                width: sectionBoxSize,
                decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Terms Of Service',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
//-----------------------------------
// Text:
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                child: Container(
                  child: Text(
                    'Stock Text\nStock Text\nStock Text\nStock Text\nStock Text\nStock Text\nStock Text\nStock Text\nStock Text\nStock Text\n',
                    style: TextStyle(
                      color: blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
//-----------------------------------
// Submit Button:
              SizedBox(
                height: height * 0.15,
              ),
              Container(
                height: height * 0.1,
                width: width * 0.7,
                child: GestureDetector(
                  onTap: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: blue,
                    color: green,
                    elevation: 3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: white,
                            //fontFamily: 'Museo',
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
