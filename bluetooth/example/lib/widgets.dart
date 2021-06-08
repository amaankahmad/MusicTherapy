// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

//----------------- HOW DEVICE NAMES ARE SHOWN ----------------------
class ScanResultTile extends StatelessWidget {
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.length > 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          // Text(
          //   result.device.id.toString(),
          //   style: Theme.of(context).textTheme.caption,
          // )
        ],
      );
    } else {
      return Text(result.device.id.toString()); // No device name so show id
    }
  }

  // Widget _buildAdvRow(BuildContext context, String title, String value) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(title, style: Theme.of(context).textTheme.caption),
  //         SizedBox(
  //           width: 12.0,
  //         ),
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: Theme.of(context).textTheme.caption?.apply(color: green),
  //             softWrap: true,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // String getNiceHexArray(List<int> bytes) {
  //   return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
  //       .toUpperCase();
  // }

  // String getNiceManufacturerData(Map<int, List<int>> data) {
  //   if (data.isEmpty) {
  //     return 'N/A';
  //   }
  //   List<String> res = [];
  //   data.forEach((id, bytes) {
  //     res.add(
  //         '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
  //   });
  //   return res.join(', ');
  // }

  // String getNiceServiceData(Map<String, List<int>> data) {
  //   if (data.isEmpty) {
  //     return 'N/A';
  //   }
  //   List<String> res = [];
  //   data.forEach((id, bytes) {
  //     res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
  //   });
  //   return res.join(', ');
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: Change from Expansion to something else
    return ListTile(
      title: _buildTitle(context),
      // leading: Text(result.rssi.toString()),
      trailing: Expanded(
        child: Container(
          child: GestureDetector(
            onTap: (result.advertisementData.connectable) ? onTap : null,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              shadowColor: orange,
              color: green,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ),
          ),
        ),
      ),
      // FloatingActionButton(

      //   // child: Text('CONNECT'),
      //   child: Icon(Icons.add_circle_outline_rounded),

      //   backgroundColor: blue,
      //   // textColor: Colors.white,
      //   onPressed: (result.advertisementData.connectable) ? onTap : null,
      // ),
      // children: <Widget>[
      //   // _buildAdvRow(
      //   //     context, 'Complete Local Name', result.advertisementData.localName),
      //   // _buildAdvRow(context, 'Tx Power Level',
      //   //     '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
      //   // _buildAdvRow(context, 'Manufacturer Data',
      //   //     getNiceManufacturerData(result.advertisementData.manufacturerData)),
      //   // _buildAdvRow(
      //   //     context,
      //   //     'Service UUIDs',
      //   //     (result.advertisementData.serviceUuids.isNotEmpty)
      //   //         ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
      //   //         : 'N/A'),
      //   // _buildAdvRow(context, 'Service Data',
      //   //     getNiceServiceData(result.advertisementData.serviceData)),
      // ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);
  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.length > 0) {
      return Column(
        children: characteristicTiles,
      );
      // return ExpansionTile(
      //   title: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Text('Service'),
      //       Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}',
      //           style: Theme.of(context).textTheme.body1?.copyWith(
      //               color: Theme.of(context).textTheme.caption?.color))
      //     ],
      //   ),
      //   children: characteristicTiles,
      // );
    } else {
      return ListTile(
        title: Text('Service'),
        subtitle:
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }
}

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;
  final VoidCallback? onNotificationPressed;
  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      required this.descriptorTiles,
      this.onReadPressed,
      this.onWritePressed,
      this.onNotificationPressed})
      : super(key: key);

  @override
  _CharacteristicTileState createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);

  final assetsAudioPlayer_1 = AssetsAudioPlayer();
  final assetsAudioPlayer_2 = AssetsAudioPlayer();
  final assetsAudioPlayer_3 = AssetsAudioPlayer();
  final assetsAudioPlayer_4 = AssetsAudioPlayer();
  final assetsAudioPlayer_5 = AssetsAudioPlayer();
  final assetsAudioPlayer_6 = AssetsAudioPlayer();
  final assetsAudioPlayer_7 = AssetsAudioPlayer();

  int reps = 0;

  late Timer timer;

  Stopwatch s = new Stopwatch();

  void increase_2(int reps) {
    if (reps >= 5) {
      setState(() {
        assetsAudioPlayer_2.setVolume(0.5);
      });
    }
  }

  void increase_3(int reps) {
    if (reps >= 10) {
      setState(() {
        assetsAudioPlayer_3.setVolume(0.7);
      });
    }
  }

  void increase_4(int reps) {
    if (reps >= 15) {
      setState(() {
        assetsAudioPlayer_4.setVolume(0.7);
      });
    }
  }

  void increase_5(int reps) {
    if (reps >= 20) {
      setState(() {
        assetsAudioPlayer_5.setVolume(0.5);
      });
    }
  }

  void increase_6(int reps) {
    if (reps >= 25) {
      setState(() {
        assetsAudioPlayer_6.setVolume(0.7);
      });
    }
  }

  void increase_7(int reps) {
    if (reps >= 30) {
      setState(() {
        assetsAudioPlayer_7.setVolume(0.7);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_2(reps));
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_3(reps));
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_4(reps));
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_5(reps));
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_6(reps));
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => increase_7(reps));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: widget.characteristic.value,
      initialData: widget.characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        // var reps = 0;
        if (value?.length != 0) {
          if (value![0] < 100) {
            reps = value[0];
          }
        } else {
          reps = 0;
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                  ),
                  Column(
                    children: [
                      Text(
                        'Rep Counter:',
                        style: TextStyle(
                          color: blue,
                          fontSize: 20,
                        ),
                      ),
                      // Text(
                      //     '0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}',
                      //     style: Theme.of(context).textTheme.body1?.copyWith(
                      //         color: Theme.of(context).textTheme.caption?.color))
                      Container(
                        child: Text(
                          reps.toString(),
                          style: TextStyle(
                            color: blue,
                            fontSize: 125,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(s.elapsedMilliseconds.toString()),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
// ------------- START MUSIC ---------------
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            // Music On Tap Function
                            assetsAudioPlayer_1.open(
                                Audio('assets/tracks/kick.wav'),
                                volume: 0.5);
                            assetsAudioPlayer_2.open(
                                Audio('assets/tracks/highhat.wav'),
                                volume: 0);
                            assetsAudioPlayer_3.open(
                                Audio('assets/tracks/bass.wav'),
                                volume: 0);
                            assetsAudioPlayer_4.open(
                                Audio('assets/tracks/piano.wav'),
                                volume: 0);
                            assetsAudioPlayer_5.open(
                                Audio('assets/tracks/beat.wav'),
                                volume: 0);
                            assetsAudioPlayer_6.open(
                                Audio('assets/tracks/guitar.wav'),
                                volume: 0);
                            assetsAudioPlayer_7.open(
                                Audio('assets/tracks/horns.wav'),
                                volume: 0);
                            s.start();

                            // print(s.elapsedTicks);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(40),
                            shadowColor: orange,
                            color: blue,
                            elevation: 3,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Start Music',
                                  style: TextStyle(
                                    color: white,
                                    //fontFamily: 'Museo',
                                    fontSize: 18,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
// ------------- START COUNTING REPS ---------------
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: widget.onNotificationPressed,
                          child: Material(
                            borderRadius: BorderRadius.circular(40),
                            shadowColor: orange,
                            color: green,
                            elevation: 3,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Start Counting',
                                  style: TextStyle(
                                    color: white,
                                    // fontFamily: 'Museo',
                                    fontSize: 18,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//---------------- STOP BUTTON ------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      // Music On Tap Function
                      assetsAudioPlayer_1.stop();
                      assetsAudioPlayer_2.stop();
                      assetsAudioPlayer_3.stop();
                      assetsAudioPlayer_4.stop();
                      assetsAudioPlayer_5.stop();
                      assetsAudioPlayer_6.stop();
                      assetsAudioPlayer_7.stop();
                      s.stop();
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: orange,
                      color: yellow,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: Text(
                            'Stop Music',
                            style: TextStyle(
                              color: white,
                              //fontFamily: 'Museo',
                              fontSize: 18,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        trailing:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.file_download,
            //     color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            //   ),
            //   onPressed: onReadPressed,
            // ),
            // IconButton(
            //   icon: Icon(Icons.file_upload,
            //       color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
            //   onPressed: onWritePressed,
            // ),
            IconButton(
              icon: Icon(
                  widget.characteristic.isNotifying
                      ? Icons.sync_disabled
                      : Icons.sync,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
              // onPressed: () => {
              //   onNotificationPressed,
              //   // Music play
              // },
              onPressed: widget.onNotificationPressed,
            )
          ],
        );
        //   children: descriptorTiles,
        // );
      },
    );
  }
}

class DescriptorTile extends StatelessWidget {
  final BluetoothDescriptor descriptor;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);

  const DescriptorTile(
      {Key? key,
      required this.descriptor,
      this.onReadPressed,
      this.onWritePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Descriptor'),
          Text('0x${descriptor.uuid.toString().toUpperCase().substring(4, 8)}',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  ?.copyWith(color: Theme.of(context).textTheme.caption?.color))
        ],
      ),
      subtitle: StreamBuilder<List<int>>(
        stream: descriptor.value,
        initialData: descriptor.lastValue,
        builder: (c, snapshot) => Text(snapshot.data.toString()),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_download,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onReadPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.file_upload,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onWritePressed,
          )
        ],
      ),
    );
  }
}

class AdapterStateTile extends StatelessWidget {
  const AdapterStateTile({Key? key, required this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        trailing: Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.subhead?.color,
        ),
      ),
    );
  }
}
