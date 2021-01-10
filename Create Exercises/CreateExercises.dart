import 'package:flutter/material.dart';


class CreateExercises extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
return MaterialApp(
home:Scaffold(
backgroundColor: Colors.green[50],
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //crossAxisAlignment: CrossAxisAlignment.baseline,
  children: [
        Text(
              'Upload\nExercise Video',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontFamily: 'Museo',
              fontSize: height * 0.04,
              color: const Color(0xFF1E325C),
              fontWeight: FontWeight.bold,
              ),
            ),
//--------------------------------------------------
//Container+Stack+Center+Column
    Container(
    height: height*0.6,
    width:width*0.8,
       decoration: BoxDecoration(  
       color:const Color(0xFFFFFBF2),//Container color
       borderRadius: BorderRadius.all(
       Radius.circular(15),  
      )
      ),
    child:Stack(
      children: [
        Center(         
         child:Column
         (children: [
           
 //Text: Enter Exercise Name:  
SizedBox(height:height*0.04),//gap      
SizedBox(
  width: width*0.7,
  height: 40,
  child:Card(
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
    color: const Color(0xFF04A489),
    child:Padding(
    padding: const EdgeInsets.all(7),
    child: Text(                              
    '  Enter Exercise Name: ',
     textAlign: TextAlign.justify,
     style: TextStyle(
     fontFamily: 'Museo',
     fontSize: 15,
     color: Colors.white,
     fontWeight: FontWeight.bold),
      ),
    ),
  ),
),
                     
//TextField in Card
SizedBox(height:8),//gap
SizedBox(
  width: width*0.7,
  height: 40,
  child:Card(
    elevation: 3,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
    color: Colors.white, 
    //margin: EdgeInsets.all(20),
    child:TextField(),
  ),
),

//Text: Preview:
SizedBox(height:height*0.06),//gap   
SizedBox(
  width: width*0.7,
  height: 40,
  child:Card(
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
    color: Colors.amber[600],
    child:Padding(
    padding: const EdgeInsets.all(7),
    child: Text(                              
    '  Preview: ',
     style: TextStyle(
     fontFamily: 'Museo',
     fontSize: 15,
     color: Colors.white,
     fontWeight: FontWeight.bold),
      ),
    ),
  ),
),

//browse file region
SizedBox(height:8),//gap
SizedBox(
  width: width*0.7,
  height: height*0.3,
  child:Card(
          child: RaisedButton(
          onPressed: (){}, //Function of the button when press
    elevation: 3,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
    color: Colors.white, 
    child:Padding(
    //move the text to center vertically
    padding: EdgeInsets.symmetric(vertical: 100,horizontal: 0),
    child: Text(                              
    'Click to browse file/\ndrag & drop',
    //move the text to center horizontally
    textAlign:TextAlign.center,
     style: TextStyle(
     fontFamily: 'Museo',
     fontSize: 15,
     color: Colors.grey,
     fontWeight: FontWeight.bold),
      ),
    ),
   ),
  ),
),

         ],)//column
        )
      ],//children
    )
    ),
//-----------------------------------------------------
    Container( 
      height: 50.0,
      width:width*0.8,
      child: RaisedButton(
        onPressed: (){}, //Function of the button when press
        color: Colors.orange,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
          ),
      child: Text(
        'Click to upload ',
       style: TextStyle(
       fontFamily: 'Museo',
       color: Colors.white,
       fontSize: height * 0.025,
       fontWeight: FontWeight.bold,
        )
      ), 
      )
    ),
  ],
),
),
),
 );
  }
  
}