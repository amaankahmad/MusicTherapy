// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EditExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: SafeArea(
        child: Column(
          children: [
            //organize everything  in a column
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //spacing
                //------------------------------------
                SizedBox(
                  height: 20.0,
                ),
                //------------------------------------

                Stack(
                  children: [
                    //Back button
                    //------------------------------------
                    Positioned(
                      top: 5,
                      left: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        //margin: EdgeInsets.only(right: 350),
                        child: Material(
                          borderRadius: BorderRadius.circular(10000),
                          shadowColor: Colors.blue,
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
                                  "assets/images/arrow.png",
                                  color: const Color(0xFF1E325C),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //------------------------------------

                    //player image
                    //------------------------------------
                    Center(
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFFFFC247), width: 12.0),
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset("assets/images/lion.png"),
                          ),
                        ),
                      ),
                    ),
                    //------------------------------------

                    //Home button
                    //------------------------------------
                    Positioned(
                      top: 5,
                      right: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        //margin: EdgeInsets.only(right: 350),
                        child: Material(
                          borderRadius: BorderRadius.circular(10000),
                          shadowColor: Colors.blue,
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
                                  color: const Color(0xFF1E325C),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //------------------------------------

                //spacing
                //------------------------------------
                SizedBox(
                  height: 20.0,
                ),
                //------------------------------------

                //Username field
                //------------------------------------
                Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Museo',
                    color: const Color(0xFF1E325C),
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                //------------------------------------

                //middle container
                //---------------------------------------------------------------------------
                Container(
                  height: 430,
                  width: 300,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBF2), //Container color
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),

                  //column for card and listview of exercises
                  child: Column(
                    children: [
                      //container for the card "exercise list"
                      //------------------------------------
                      Container(
                        width: 350.0,
                        height: 80.0,

                        //card exercise list
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          color: const Color(0xFFF57E00),
                          child: Center(
                            child: Text(
                              'Exercise List',
                              style: TextStyle(
                                fontFamily: 'Museo',
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //------------------------------------

                      //spacing
                      //------------------------------------
                      SizedBox(
                        height: 10.0,
                      ),
                      //------------------------------------

                      //container for listview
                      //------------------------------------
                      Container(
                        color: const Color(0xFFFFFBF2),
                        width: 350.0,
                        height: 320.0,

                        //listview for the exercise list to scroll
                        child: ListView(
                          children: [
                            //ROW 1
                            Row(
                              children: [
                                //rotate the "navigation" icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 1
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 1
                                Text(
                                  'exercise 1',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 1 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.clear,
                                    size: 38.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            //ROW 2
                            Row(
                              children: [
                                //rotate the icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 2
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 2
                                Text(
                                  'exercise 2',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 2 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.clear,
                                    size: 38.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            //ROW 3
                            Row(
                              children: [
                                //rotate the icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 3
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 3
                                Text(
                                  'exercise 3',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 3 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.clear,
                                    size: 38.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            //search bar
                            //------------------------------
                            TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(3.5),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: const Color(0xFF1E325C),
                                  size: 30,
                                ),
                                hintText: ' Search exercise',
                                hintStyle: TextStyle(
                                    fontFamily: 'Museo',
                                    height: 0.4,
                                    fontSize: 25),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                  borderSide:
                                      BorderSide(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                            //------------------------------

                            //ROW 4
                            Row(
                              children: [
                                //rotate the icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 4
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 4
                                Text(
                                  'exercise 4',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 4 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: 38.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),

                            //ROW 5
                            Row(
                              children: [
                                //rotate the icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 5
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 5
                                Text(
                                  'exercise 5',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 5 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: 38.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),

                            //ROW 6
                            Row(
                              children: [
                                //rotate the icon 90 degrees right
                                Transform.rotate(
                                  angle: 3.14 / 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 30.0,
                                      color: const Color(0xFF1E325C),
                                    ),
                                    onPressed: null,
                                  ),
                                ),

                                //spacing to separate icon from exercise 6
                                SizedBox(
                                  width: 30.0,
                                ),

                                //text exercise 6
                                Text(
                                  'exercise 6',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    color: const Color(0xFF1E325C),
                                    fontSize: 30.0,
                                  ),
                                ),

                                //separate exercise 6 from x icon
                                SizedBox(
                                  width: 80.0,
                                ),

                                //icon can be tapped to cancel exercise
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: 38.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                      //------------------------------------
                    ],
                  ),
                ), //---------------------------------------------------------------------------

                //button
                //------------------------------------
                Container(
                  height: 100.0,
                  width: 300.0,
                  margin: EdgeInsets.all(20.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.blue,
                    color: const Color(0xFF04A489),
                    elevation: 5,
                    //button can be tapped
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              //fontFamily: 'Museo',
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //------------------------------------
              ],
            ),
          ],
        ),
      ),
    );
  }
}
