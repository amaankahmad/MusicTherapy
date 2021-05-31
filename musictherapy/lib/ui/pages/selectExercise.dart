import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';

//------------------------
//Change exercise preview widget type
//------------------------
class SelectExercise extends StatelessWidget {
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
      //------------------------
      //Main Background
      backgroundColor: const Color(0xFFFFFBF2),
      body: Stack(
        children: [
          //------------------------
          //Back button
          Container(
            margin: EdgeInsets.only(top: 60, left: 40),
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
                shadowColor: blue,
                color: white,
                elevation: 3,
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    child: Image.asset('assets/images/navigation/arrow.jpeg'),
                  ),
                ),
              ),
            ),
          ),
          //------------------------
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //------------------------
                      //Spacing above 'Select Exercise'
                      SizedBox(
                        height: height * 0.05,
                      ),
                      //------------------------
                      //Title text&font: 'Select Exercise'
                      Text(
                        'Select\nExercise',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: height * 0.06,
                          color: const Color(0xFF1E325C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //------------------------
                      //Scrolling area
                      Container(
                        //Scrolling area background
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        height: height * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        //Scrolling area contents
                        child: Stack(
                          children: [
                            Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //------------------------
                                    //Search bar
                                    Container(
                                      width: width * 0.8,
                                      height: height * 0.045,
                                      margin: EdgeInsets.all(15.0),
                                      child: TextField(
                                        style: TextStyle(
                                            color: blue,
                                            fontSize: height * 0.025),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.all(height * 0.001),
                                          hintText: 'Search',
                                          prefixIcon: Icon(Icons.search),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //------------------------
                                    //'Arm Exercises' Bar
                                    Container(
                                      width: 0.8 * width,
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          //Text&font:'Arm Exercises'
                                          'Arm Exercises',
                                          style: TextStyle(
                                              fontSize: height * 0.035,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    //------------------------
                                    //Arm Exercises video previews *2
                                    //change widget for exercise preview
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: height * 0.2,
                                          width: width * 0.8,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          child: Text('Exercise Name'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: height * 0.2,
                                          width: width * 0.8,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    //------------------------
                                    //'Leg Exercises' Bar
                                    Container(
                                      width: 0.8 * width,
                                      margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: green,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          //Text&font:'Leg Exercises'
                                          'Leg Exercises',
                                          style: TextStyle(
                                              fontSize: height * 0.035,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        ],
      ),
    );
  }
}
