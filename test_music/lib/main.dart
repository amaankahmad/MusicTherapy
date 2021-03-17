import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final assetsAudioPlayer_1 = AssetsAudioPlayer();
  final assetsAudioPlayer_2 = AssetsAudioPlayer();
  final assetsAudioPlayer_3 = AssetsAudioPlayer();
  final assetsAudioPlayer_4 = AssetsAudioPlayer();
  final assetsAudioPlayer_5 = AssetsAudioPlayer();
  final assetsAudioPlayer_6 = AssetsAudioPlayer();
  final assetsAudioPlayer_7 = AssetsAudioPlayer();

  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);
  int _counter = 0;

  Timer timer;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void increase_2(int _counter) {
    if (_counter >= 5) {
      setState(() {
        assetsAudioPlayer_2.setVolume(1);
      });
    }
  }

  void increase_3(int _counter) {
    if (_counter >= 10) {
      setState(() {
        assetsAudioPlayer_3.setVolume(1);
      });
    }
  }

  void increase_4(int _counter) {
    if (_counter >= 15) {
      setState(() {
        assetsAudioPlayer_4.setVolume(1);
      });
    }
  }

  void increase_5(int _counter) {
    if (_counter >= 20) {
      setState(() {
        assetsAudioPlayer_5.setVolume(1);
      });
    }
  }

  void increase_6(int _counter) {
    if (_counter >= 25) {
      setState(() {
        assetsAudioPlayer_6.setVolume(1);
      });
    }
  }

  void increase_7(int _counter) {
    if (_counter >= 30) {
      setState(() {
        assetsAudioPlayer_7.setVolume(1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_2(_counter));
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_3(_counter));
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_4(_counter));
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_5(_counter));
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_6(_counter));
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => increase_7(_counter));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: honeydew,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FlatButton(
              //   onPressed: () {
              //     assetsAudioPlayer_1.open(Audio('assets/bass_loop.wav'),
              //         loopMode: LoopMode.single);
              //     // assetsAudioPlayer_1.open(Audio('assets/beat_loop.wav'),
              //     //     loopMode: LoopMode.single, volume: 1);
              //     // assetsAudioPlayer_1.open(Audio('assets/kick_loop.wav'),
              //     //     loopMode: LoopMode.single, volume: 0);
              //     // assetsAudioPlayer_1.open(Audio('assets/piano_loop.wav'),
              //     //     loopMode: LoopMode.single, volume: 0);
              //   },
              //   child: Text('Loop track 1'),
              //   color: Colors.blue,
              // ),
              // FlatButton(
              //   onPressed: () {
              //     assetsAudioPlayer_1.open(Audio('assets/beat_loop.wav'),
              //         loopMode: LoopMode.single, volume: 1);
              //   },
              //   child: Text('Loop track 1'),
              //   color: Colors.blue,
              // ),

              FloatingActionButton(
                backgroundColor: green,
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              Text(
                '$_counter',
                // style: Theme.of(context).textTheme.headline4,
              ),
              FlatButton(
                onPressed: () {
                  assetsAudioPlayer_1.open(Audio('assets/kick.wav'));
                  assetsAudioPlayer_2.open(Audio('assets/highhat.wav'),
                      volume: 0);
                  assetsAudioPlayer_3.open(Audio('assets/bass.wav'), volume: 0);
                  assetsAudioPlayer_4.open(Audio('assets/piano.wav'),
                      volume: 0);
                  assetsAudioPlayer_5.open(Audio('assets/beat.wav'), volume: 0);
                  assetsAudioPlayer_6.open(Audio('assets/guitar.wav'),
                      volume: 0);
                  assetsAudioPlayer_7.open(Audio('assets/horns.wav'),
                      volume: 0);
                },
                child: Text(
                  'Play the audio',
                  style: TextStyle(color: white, fontSize: 20
                      // fontFamily: 'Museo',
                      ),
                ),
                color: blue,
              ),
              FlatButton(
                onPressed: () {
                  assetsAudioPlayer_1.pause();
                  assetsAudioPlayer_2.pause();
                  assetsAudioPlayer_3.pause();
                  assetsAudioPlayer_4.pause();
                },
                child: Text(
                  'Pause the audio',
                  style: TextStyle(color: white, fontSize: 20
                      // fontFamily: 'Museo',
                      ),
                ),
                color: blue,
              ),
              FlatButton(
                onPressed: () {
                  assetsAudioPlayer_1.stop();
                  assetsAudioPlayer_2.stop();
                  assetsAudioPlayer_3.stop();
                  assetsAudioPlayer_4.stop();
                  assetsAudioPlayer_5.stop();
                  assetsAudioPlayer_6.stop();
                  assetsAudioPlayer_7.stop();
                },
                child: Text(
                  'Stop the audio',
                  style: TextStyle(color: white, fontSize: 20
                      // fontFamily: 'Museo',
                      ),
                ),
                color: blue,
              ),
              // FlatButton(
              //   onPressed: () {
              //     assetsAudioPlayer_2.setVolume(1);
              //   },
              //   child: Text('Add instrument two'),
              //   color: Colors.blue,
              // ),
              // FlatButton(
              //   onPressed: () {
              //     assetsAudioPlayer_3.setVolume(1);
              //   },
              //   child: Text('Add instrument three'),
              //   color: Colors.blue,
              // ),
              // FlatButton(
              //   onPressed: () {
              //     assetsAudioPlayer_4.setVolume(1);
              //   },
              //   child: Text('Add instrument four'),
              //   color: Colors.blue,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
