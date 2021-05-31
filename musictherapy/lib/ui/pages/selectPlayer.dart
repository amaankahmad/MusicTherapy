import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';

class SelectPlayer extends StatefulWidget {
  @override
  _SelectPlayerState createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
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
      backgroundColor: honeydew,
      body: SafeArea(
        child: Stack(
          children: [
//----------------------------
// Home button (Redundant, kept in case we change our minds)
/*
            Positioned(
              top: 15,
              right: 40,
              child: Container(
                width: 50,
                height: 50,
                child: Material(
                  borderRadius: BorderRadius.circular(10000),
                  shadowColor: blue,
                  color: white,
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdminStartPage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 12,
                          right: 12,
                          bottom: 12,
                        ),
                        child: Image.asset(
                          'assets/images/navigation/home.png',
                          color: blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
*/

//---------------------------------
//Back button
            Positioned(
              top: 15,
              left: 40,
              child: Container(
                width: 50,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdminStartPage(),
                      ),
                    );
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(10000),
                    shadowColor: const Color(0xFF1E325C),
                    elevation: 5,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
//-----------------------------------
// Text for 'Select Player
                Text(
                  'Select\nPlayer',
                  style: TextStyle(
                    fontFamily: 'Museo',
                    fontSize: height * 0.06,
                    color: blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
//-----------------------------------
// Container -> Stack -> Center -> Column
                Container(
                  height: height * 0.6,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFBF2),
                      //Container color
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )),
                  child: Stack(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
//---------------------------------------
// Padding + SizedBox + Container + SizedBox
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), //Rounded edges for card of 'Player list
                                  ),
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: height * 0.025),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                //Sets padding around 'Player list'
                                child: Card(
                                  elevation: 3,

                                  color:
                                      green, // Set background colour for 'Player list'
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), //Rounded edges for card of 'Player list
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  //Sets margin for card of 'Player list'
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5,
                                        horizontal:
                                            90), //Sets padding for 'Player List'. Check if Hard coded
                                    child: Text(
                                      //Set font style and size for 'Player list'
                                      'Player List',
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: height * 0.035,
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
                                height: height * 0.5,
                                child: GridView.count(
                                  //Creates grid
                                  padding: const EdgeInsets.all(
                                      20), //Padding for grid
                                  crossAxisSpacing: width *
                                      0.024, //Sets horizontal spacing between each circle
                                  mainAxisSpacing: height *
                                      0.02, //Sets vertical spacing between each circle
                                  crossAxisCount:
                                      2, //Sets how many units for width of grid
                                  children: List.generate(18, (int index) {
                                    //generated 18 circles
                                    return Column(
                                      //Column so that can contain circle and text
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, //Centered both items
                                      children: [
                                        FlatButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: height * 0.14,
                                            height: height * 0.14,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: orange, width: 12.0),
                                            ),
                                            child: ClipOval(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Image.asset(
                                                    "assets/images/avatars/lion.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                          'User ${index + 1}',
                                          style: TextStyle(
                                            color: const Color(0xFF1E325C),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Museo',
                                            fontSize: height * 0.024,
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
                    ],
                  ),
                ),
//--------------------------------------
// Flat button for 'Add another player'
                FlatButton(
                  onPressed:
                      () {}, //Fill in to make button functional when pressed
                  child: Card(
                    elevation: 3,
                    //Creates orange card at the bottom
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    margin: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.05), //Sets margins for card
                    color: yellow,
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
                              fontSize: height * 0.035,
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
    );
  }
}
