import 'package:flutter/material.dart';

class PlayerStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF2BA49);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
     return Scaffold(
       backgroundColor: white,
       body: Column(
         //crossAxisAlignment: CrossAxisAlignment.center,
         //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             SizedBox(
               height: height * 0.1,
             ),

             CircleAvatar(
               radius: 70,
               backgroundColor: orange,
               child: CircleAvatar(
                 radius: 60,
                 backgroundImage: AssetImage("images/parrot.jpg"),
               ),
             ),
             SizedBox(
                  height: height * 0.1,
                  ),
             Center(
               child: Container(
                 child: Text(
                   'Hello, Sam',
                   style: TextStyle(
                     //fontFamily: 'Museo',
                     fontSize: height * 0.08,
                     color: blue,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: height * 0.1,
             ),
             Container(
               width: width * 0.7,
               height: height * 0.25,
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
                         'Start!',
                         style: TextStyle(
                           color: white,
                           //fontFamily: 'Museo',
                           fontSize: 60,
                           //fontWeight: FontWeight.w700,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: height * 0.04,
             ),
             Container(
               width: width * 0.7,
               child: Material(
                 borderRadius: BorderRadius.circular(40),
                 shadowColor: blue,
                 color: white,
                 elevation: 5,
                 child: GestureDetector(
                   onTap: () {},
                   child: Center(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 12),
                       child: Text(
                         'Settings',
                         style: TextStyle(
                           color: green,
                           //fontFamily: 'Museo',
                           fontSize: 40,
                           //fontWeight: FontWeight.w700,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ),


              ]
          )
      );
  }
}

