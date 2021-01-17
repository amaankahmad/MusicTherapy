import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//------------------------
//Change exercise preview widget type
//------------------------
class SelectExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    return MaterialApp(
        home: Scaffold(
            //------------------------
            //Main Background
            backgroundColor: const Color(0xFFFFFBF2),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //------------------------
                  //Back button
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 50,
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(10000),
                      shadowColor: blue,
                      color: white,
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 12,
                              right: 12,
                              bottom: 12,
                            ),
                            child: Image.asset('images/arrow.jpeg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                          height: height * 0.7,
                          width: width * 0.9,
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
                                        width: 0.8 * width,
                                        margin: EdgeInsets.all(10.0),
                                        child: TextField(
                                          cursorColor: blue,
                                          decoration: InputDecoration(
                                            hoverColor: Colors.grey,
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
                                        margin: EdgeInsets.all(10.0),
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
            )));
  }
}
