import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musictherapy/ui/pages/adminStartPage.dart';
import 'package:musictherapy/ui/pages/forgotPassword.dart';
import 'package:musictherapy/ui/pages/machineLearningVision.dart';
import 'package:musictherapy/ui/pages/playerStartPage.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras; // Create a list of camera frames

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras(); // Turn on camera
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return MaterialApp(
      title: 'Music Therapy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Museo',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MLVision(),
    );
  }
}
