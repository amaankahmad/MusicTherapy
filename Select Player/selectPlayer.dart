import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:search_widget/search_widget.dart';

class SelectPlayer extends StatefulWidget {
  @override
  _SelectPlayerState createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: SafeArea(
          // Created a Stack. Within the stack is a Center widget and Column widget
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  //Within Center is a Single Child Scroll View which contains a Card
                  //Card contains a Column, which has the 'Player List', Sized Box and Container which contains grid
                  child: Card(
                    color: const Color(0xFFFFFBF2), //set colour of centre
                    margin: EdgeInsets.symmetric(
                        horizontal: width *
                            0.05), //Sets horizontal margin from end of screen
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // Rounded edges for card
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), //Sets padding around 'Player list'
                          child: Card(
                            color: const Color(
                                0xFF04A489), // Set background colour for 'Player list'
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), //Rounded edges for card of 'Player list
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    5), //Sets margin for card of 'Player list'
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.5,
                                  horizontal:
                                      120), //Sets padding for 'Player List'. Check if Hard coded
                              child: Text(
                                //Set font style and size for 'Player list'
                                'Player List',
                                style: TextStyle(
                                    fontFamily: 'Museo',
                                    fontSize: height * 0.025,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          //Creates gap between Player list and Table
                          height: 5,
                        ),
                        Container(
                          height: height * 0.6,
                          child: GridView.count(
                            //Creates grid
                            padding:
                                const EdgeInsets.all(20), //Padding for grid
                            crossAxisSpacing:
                                10.0, //Sets horizontal spacing between each circle
                            mainAxisSpacing:
                                10.0, //Sets vertical spacing between each circle
                            crossAxisCount:
                                3, //Sets how many units for width of grid
                            children: List.generate(18, (index) {
                              //generated 18 circles
                              return Column(
                                //Column so that can contain circle and text
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Centered both items
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        //Creates shadow around each circle
                                        BoxShadow(
                                            offset: Offset(0, 3),
                                            blurRadius: 2.5,
                                            color: Colors.black45,
                                            spreadRadius: 2.5)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      color: const Color(0xFF1E325C),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Museo',
                                      fontSize: height * 0.015,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 20, //Creates space at bottom of grid
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                //Contains another Column and the '+ another player'
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Puts first column at top and second at bottom
                children: [
                  Column(
                    //Contains the 'view player' and 'select player'
                    crossAxisAlignment: CrossAxisAlignment.center, //Centers all
                    children: [
                      Text(
                        'View Player Stats',
                        style: TextStyle(
                          fontFamily: 'Museo',
                          fontSize: height * 0.02,
                          color: const Color(0xFF1E325C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Select Player',
                        style: TextStyle(
                          fontFamily: 'Museo',
                          fontSize: height * 0.05,
                          color: const Color(0xFF1E325C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed:
                        () {}, //Fill in to make button functional when pressed
                    child: Card(
                      //Creates orange card at the bottom
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: width * 0.10), //Sets margins for card
                      color: Colors.orange,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ Add another player',
                              style: TextStyle(
                                fontFamily: 'Museo',
                                color: Colors.white,
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
