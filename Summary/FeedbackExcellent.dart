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

class FeedbackExcellent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final blue = const Color(0xFF1E325C);

    // TODO: implement build
return MaterialApp(
home:Scaffold(
backgroundColor: const Color(0xFFFFFBF2),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
  //----------------------------------------------------
  //Orange container with text 'Superstar!...'
    Container(
    height: height*0.25,
    width:width*0.85,
       decoration: BoxDecoration(  
       color: Colors.orange[700],//Container color
       borderRadius: BorderRadius.all(
       Radius.circular(30),  
      )
      ),

      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,//center the text vertically
      children: <Widget>[
      Text(
              'Superstar!',
              style: TextStyle(
              fontFamily: 'Museo',
              fontSize: height * 0.06,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
              ),
            ),

      SizedBox(height:8),//gap   

      Text(
              '38 reps today',
              style: TextStyle(
              fontFamily: 'Museo',
              fontSize: height * 0.035,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              ),
            ),
      ],
      ),
      ),
   SizedBox(height:20),//gap   
  //-------------------------------------------------
  //Star Image
    Container(
      width: height*0.2,
      height: height*0.2,

        child: Image.asset(
        "assets/images/star.JPG",
        //colorBlendMode: BlendMode.color,
        fit:BoxFit.cover,
      ),

    ),
    SizedBox(height:20),//gap   
  //-------------------------------------------------
  //green container with text 'Score:85%'
    Container(
    height: height*0.2,
    width:width*0.7,
       decoration: BoxDecoration(  
       color: Colors.green[50],//Container color
       borderRadius: BorderRadius.all(
       Radius.circular(30),  
      )
      ),

      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,//center the text vertically
      children: <Widget>[
      Text(
              'Score:85%',
              style: TextStyle(
              fontFamily: 'Museo',
              fontSize: height * 0.045,
              color: blue,
              fontWeight: FontWeight.w700,
              ),
            ),

      SizedBox(height:5),//gap  

      Text(
              '+10% accuracy\nfrom last session',
              style: TextStyle(
              fontFamily: 'Museo',
              fontSize: height * 0.025,
              color: blue,
              fontWeight: FontWeight.bold,
              ),
            ),
      ],
      ),
      ),
  SizedBox(height:height*0.05),//gap
//----------------------------------------------------
//Button: 'go back to home page'
    Container( 
      height: height*0.1,
      width:width*0.85,
      child: RaisedButton(
        onPressed: (){}, //Function of the button when press
        color: Colors.orange[300],
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
          ),
      child: Text(
        'Go back to Home Page',
       style: TextStyle(
       fontFamily: 'Museo',
       color: Colors.white,
       fontSize: height * 0.03,
       fontWeight: FontWeight.bold,
        )
      ), 
      )
    ),
  ],
),
),
)
);
  }
}