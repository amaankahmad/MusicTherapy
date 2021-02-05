import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musictherapy/ui/pages/confirmExerciseUpload.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateExercises extends StatefulWidget {
  @override
  _CreateExercisesState createState() => _CreateExercisesState();
}

class _CreateExercisesState extends State<CreateExercises> {
  String videoUrl;

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
      backgroundColor: honeydew,
      body:
//-----------------------------------------
// Back Button:
          Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: blue,
                elevation: 5,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmExerciseUploadPage(),
                      ),
                    );
                  },
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset(
                        "assets/images/navigation/arrow.jpeg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
//--------------------------------------------------------
//Center+Column+Text...
//Text "upload exercise video"
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Upload\nExercise Video',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Museo',
                    fontSize: height * 0.04,
                    color: const Color(0xFF1E325C),
                    fontWeight: FontWeight.w700,
                  ),
                ),
//--------------------------------------------------
//Container+Stack+Center+SingleChildScrollView+Column
                Container(
                    height: height * 0.6,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: white, //Container color
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: Stack(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              //Text "Enter Exercise Name:"
                              SizedBox(height: height * 0.04), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: green,
                                  child: Padding(
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
                              SizedBox(height: 8), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  elevation: 3,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: Colors.white,
                                  //margin: EdgeInsets.all(20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4),
                                    child: TextField(),
                                  ),
                                ),
                              ),

//Text: "Upload video below:"
                              SizedBox(height: height * 0.05), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '  Upload video below:',
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

//browse file button
                              SizedBox(height: 8), //gap
                              Container(
                                  width: width * 0.7,
                                  height: height * 0.25,
                                  child: Column(
                                    children: [
                                      (videoUrl != null)
                                          ? Image.network(videoUrl)
                                          : Placeholder(
                                              fallbackHeight: 100.0,
                                              fallbackWidth: double.infinity),
                                      RaisedButton(
                                        child: Text(
                                          'Click to browse file/\ndrag & drop',
                                          //move the text to center horizontally
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Museo',
                                              fontSize: 18,
                                              color: Colors.grey[400],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () =>
                                            uploadVideo(), //Function of the button when press
                                        color: Colors.white,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ],
                                  )),
//----------------------------------------------------
//Text: "Upload data file below"
                              SizedBox(height: height * 0.05), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '  Upload data file below: ',
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

//browse file button
                              SizedBox(height: 8), //gap
                              Container(
                                  width: width * 0.7,
                                  height: height * 0.25,
                                  child: RaisedButton(
                                    onPressed:
                                        () {}, //Function of the button when press
                                    color: Colors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'Click to browse file/\ndrag & drop',
                                      //move the text to center horizontally
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 18,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ) //column
                              ),
                        ),
                      ], //children
                    )),

//-----------------------------------------------------
//Orange Upload Button
                Container(
                    height: 50.0,
                    width: width * 0.75,
                    child: RaisedButton(
                      onPressed: () {}, //Function of the button when press
                      color: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Text('Click to upload ',
                          style: TextStyle(
                            fontFamily: 'Museo',
                            color: Colors.white,
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
//-----------------------------------------------------
              ],
            ),
          ), //Center
        ],
      ), //stack
    );
  }

  uploadVideo() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile video;

    //Check for permissiom
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select video
      video = await _picker.getVideo(source: ImageSource.gallery);
      var file = File(video.path);

      if (video != null) {
        // Upload to firebase
        //Check___________
        var snapshot =
            await _storage.ref().child("folderName/videoName").putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          videoUrl = downloadUrl;
        });
      } else {
        print("No path received");
      }
    } else {
      print("Grant Permissions and Try Again");
    }

    // Upload to firebase
  }
}

/*class CreateExercises extends StatelessWidget {
  

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
      backgroundColor: honeydew,
      body:
//-----------------------------------------
// Back Button:
          Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10000),
                shadowColor: blue,
                elevation: 5,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmExerciseUploadPage(),
                      ),
                    );
                  },
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 10,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset(
                        "assets/images/navigation/arrow.jpeg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
//--------------------------------------------------------
//Center+Column+Text...
//Text "upload exercise video"
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Upload\nExercise Video',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Museo',
                    fontSize: height * 0.04,
                    color: const Color(0xFF1E325C),
                    fontWeight: FontWeight.w700,
                  ),
                ),
//--------------------------------------------------
//Container+Stack+Center+SingleChildScrollView+Column
                Container(
                    height: height * 0.6,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: white, //Container color
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: Stack(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              //Text "Enter Exercise Name:"
                              SizedBox(height: height * 0.04), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: green,
                                  child: Padding(
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
                              SizedBox(height: 8), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  elevation: 3,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: Colors.white,
                                  //margin: EdgeInsets.all(20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4),
                                    child: TextField(),
                                  ),
                                ),
                              ),

//Text: "Upload video below:"
                              SizedBox(height: height * 0.05), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '  Upload video below:',
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

//browse file button
                              SizedBox(height: 8), //gap
                              Container(
                                  width: width * 0.7,
                                  height: height * 0.25,
                                  child: RaisedButton(
                                    onPressed:
                                        () {}, //Function of the button when press
                                    color: Colors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'Click to browse file/\ndrag & drop',
                                      //move the text to center horizontally
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 18,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
//----------------------------------------------------
//Text: "Upload data file below"
                              SizedBox(height: height * 0.05), //gap
                              SizedBox(
                                width: width * 0.7,
                                height: 40,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '  Upload data file below: ',
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

//browse file button
                              SizedBox(height: 8), //gap
                              Container(
                                  width: width * 0.7,
                                  height: height * 0.25,
                                  child: RaisedButton(
                                    onPressed:
                                        () {}, //Function of the button when press
                                    color: Colors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'Click to browse file/\ndrag & drop',
                                      //move the text to center horizontally
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Museo',
                                          fontSize: 18,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ) //column
                              ),
                        ),
                      ], //children
                    )),

//-----------------------------------------------------
//Orange Upload Button
                Container(
                    height: 50.0,
                    width: width * 0.75,
                    child: RaisedButton(
                      onPressed: () {}, //Function of the button when press
                      color: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Text('Click to upload ',
                          style: TextStyle(
                            fontFamily: 'Museo',
                            color: Colors.white,
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
//-----------------------------------------------------
              ],
            ),
          ), //Center
        ],
      ), //stack
    );
  }
}*/
