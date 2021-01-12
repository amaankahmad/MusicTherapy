import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFF1FAEE);
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//-----------------------------------
// Spacing for Logo:
          SizedBox(
            height: height * 0.10,
          ),
//-----------------------------------
// Text for 'Select Player:
          Center(
            child: Container(
              child: Text(
                'Logo',
                style: TextStyle(
                  fontFamily: 'Museo',
                  fontSize: height * 0.09,
                  color: green,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                  decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(
                      fontFamily: 'Museo',
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
                  decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: TextStyle(
                      fontFamily: 'Museo',
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
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: orange,
                        fontFamily: 'Museo',
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
                  height: height * 0.15,
                ),
//-----------------------------------
// Sign In Button:
                Container(
                  width: width * 0.6,
                  child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: blue,
                      color: orange,
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Sign In!',
                              style: TextStyle(
                                color: white,
                                fontFamily: 'Museo',
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
//-----------------------------------
// Spacing for Button:
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
                          fontFamily: 'Museo',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decorationColor: orange,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: orange,
                            fontFamily: 'Museo',
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
