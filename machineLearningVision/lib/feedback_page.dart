/*
There are two versions depending on the performance of the player during the gameplay
The only differences are:
	1) Encouragement at the top 
	(>80% "Superstar!"; <80% "Rock on!")
	2) Picture matching encouragement (1) at the top
	(i.e. >80% Stars; <80% music notes)
	3) Words under the score 
	(If no improvement from last session "keep going";
if there is improvement from last session then give a stat)
*/
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  final List<double> movement;
  final int percentage;
  final String feedback;

  const FeedbackPage({Key key, this.movement, this.percentage, this.feedback})
      : super(key: key);

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

    // TODO: implement build
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //----------------------------------------------------
            //Orange container with text 'Superstar!...'
            Container(
              height: height * 0.25,
              width: width * 0.85,
              decoration: BoxDecoration(
                  color: orange, //Container color
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, //center the text vertically
                children: <Widget>[
                  Text(
                    'Superstar!',
                    style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.06,
                      color: honeydew,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),

                  SizedBox(height: 8), //gap

                  Text(
                    '18 reps today',
                    style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.035,
                      color: honeydew,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //-------------------------------------------------
            //Star Image
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                  color: honeydew, //Container color
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, //center the text vertically
                children: <Widget>[
                  Text(
                    'Score: $percentage%',
                    style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.045,
                      color: blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height * 0.04), //gap
                  Container(
                    width: height * 0.2,
                    height: height * 0.2,
                    child: Image.asset(
                      "assets/fireworks.png",
                      //colorBlendMode: BlendMode.color,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30), //gap
                  //-------------------------------------------------
                  //honeydew  container with text 'Score:85%'
                  // Container(
                  //   height: height * 0.2,
                  //   width: width * 0.65,
                  //   decoration: BoxDecoration(
                  //       color: honeydew, //Container color
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(30),
                  //       )),
                  //   child: Column(
                  //     mainAxisAlignment:
                  //         MainAxisAlignment.center, //center the text vertically
                  //     children: <Widget>[
                  //       Text(
                  //         'Score: $percentage%',
                  //         style: TextStyle(
                  //           fontFamily: 'Museo',
                  //           fontSize: height * 0.045,
                  //           color: blue,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       )

                  Text(
                    '+7% accuracy from last session',
                    style: TextStyle(
                      fontFamily: 'Museo',
                      fontSize: height * 0.024,
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), //gap

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      feedback,
                      style: TextStyle(
                        fontFamily: 'Museo',
                        fontSize: height * 0.025,
                        color: blue,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.04), //gap
//----------------------------------------------------
//Button: 'go back to home page'
            Container(
              height: height * 0.1,
              width: width * 0.75,
              child: RaisedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => PlayerStartPage(),
                  //   ),
                  // );
                }, //Function of the button when press
                color: yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Text(
                  'Go back to Home Page',
                  style: TextStyle(
                    fontFamily: 'Museo',
                    color: Colors.white,
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
