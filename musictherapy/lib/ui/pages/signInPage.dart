import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/forgotPassword.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';
import 'package:musictherapy/ui/pages/signUpPage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//-----------------------------------
// Spacing for Logo:
          SizedBox(
            height: height * 0.05,
          ),
//-----------------------------------
// LOGO
          Center(
            child: Column(
              children: [
                Container(
                  height: height * 0.22,
                  child: Image.asset('assets/images/other/logo.jpeg'),
                ),
                Text(
                  'melomotion',
                  style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.05,
                      color: blue),
                ),
              ],
            ),
          ),
//-----------------------------------
// Spacing for Text Fields:
          SizedBox(
            height: 20,
          ),
//-----------------------------------
// Column for Email and Password Text Fields:
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
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment(1, 0),
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
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
//-----------------------------------
// Spacing for Button:
                SizedBox(
                  height: height * 0.1,
                ),
//-----------------------------------
// Sign In Button:
                GestureDetector(
                  onTap: () async {
                    final user = await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    if (user != null) {
                      final cUser = FirebaseAuth.instance.currentUser;
                      _firestore
                          .collection("user_info")
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
                    }
                  },
                  child: Container(
                    width: width * 0.6,
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: orange,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Sign In!',
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

//-----------------------------------
// Spacing for Text:
                SizedBox(
                  height: height * 0.03,
                ),
//-----------------------------------
// Sign Up:
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: orange,
                          //fontFamily: 'Museo',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decorationColor: orange,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
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
