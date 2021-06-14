import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/Bluetooth_Off_Screen.dart';
import 'package:flutter_blue_example/Find_Devices_Screen.dart';
import 'package:flutter_blue_example/widgets.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);
  final BluetoothDevice device;

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    // onReadPressed: () => c.read(),
                    // onWritePressed: () async {
                    //   await c.write(_getRandomBytes(), withoutResponse: true);
                    //   await c.read();
                    // },
                    onNotificationPressed: () async {
                      await c.setNotifyValue(!c.isNotifying);
                      await c.read();
                    },
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            // onReadPressed: () => d.read(),
                            // onWritePressed: () => d.write(_getRandomBytes()),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//----------------- APP BAR ----------------------
      // appBar: AppBar(
      //   backgroundColor: orange,
      //   // title: Text(device.name),
      //   title: Text(
      //     'Melomotion',
      //     style: TextStyle(fontSize: 25),
      //   ),

      //   actions: <Widget>[
      //     StreamBuilder<BluetoothDeviceState>(
      //       stream: device.state,
      //       initialData: BluetoothDeviceState.connecting,
      //       builder: (c, snapshot) {
      //         VoidCallback? onPressed;
      //         String text;
      //         switch (snapshot.data) {
      //           case BluetoothDeviceState.connected:
      //             onPressed = () => device.disconnect();
      //             text = 'DISCONNECT';

      //             break;
      //           case BluetoothDeviceState.disconnected:
      //             onPressed = () => device.connect();
      //             text = 'CONNECT';
      //             break;
      //           default:
      //             onPressed = null;
      //             text = snapshot.data.toString().substring(21).toUpperCase();
      //             break;
      //         }
      //         return FlatButton(
      //           onPressed: onPressed,
      //           child: Text(
      //             text,
      //             style: Theme.of(context)
      //                 .primaryTextTheme
      //                 .button
      //                 ?.copyWith(color: Colors.white),
      //           ),
      //         );
      //       },
      //     )
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // StreamBuilder<BluetoothDeviceState>(
          //   stream: device.state,
          //   initialData: BluetoothDeviceState.connecting,
          //   builder: (c, snapshot) => ListTile(
          //     leading: (snapshot.data == BluetoothDeviceState.connected)
          //         ? Icon(Icons.bluetooth_connected)
          //         : Icon(Icons.bluetooth_disabled),
          //     title: Text(
          //         'Device is ${snapshot.data.toString().split('.')[1]}.'),
          //     subtitle: Text('${device.id}'),
          //     trailing: StreamBuilder<bool>(
          //       stream: device.isDiscoveringServices,
          //       initialData: false,
          //       builder: (c, snapshot) => IndexedStack(
          //         index: snapshot.data! ? 1 : 0,
          //         children: <Widget>[
          //           IconButton(
          //             icon: Icon(Icons.refresh),
          //             onPressed: () => device.discoverServices(),
          //           ),
          //           IconButton(
          //             icon: SizedBox(
          //               child: CircularProgressIndicator(
          //                 valueColor: AlwaysStoppedAnimation(Colors.grey),
          //               ),
          //               width: 18.0,
          //               height: 18.0,
          //             ),
          //             onPressed: null,
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // StreamBuilder<int>(
          //   stream: device.mtu,
          //   initialData: 0,
          //   builder: (c, snapshot) => ListTile(
          //     title: Text('MTU Size'),
          //     subtitle: Text('${snapshot.data} bytes'),
          //     trailing: IconButton(
          //       icon: Icon(Icons.edit),
          //       onPressed: () => device.requestMtu(223),
          //     ),
          //   ),
          // ),
// ------------- GROOVE METER ---------------
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          //   child: Container(
          //     width: 500,
          //     height: 10,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(40), color: orange),
          //   ),
          // ),
          // TODO change app font
          SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10000),
                    shadowColor: const Color(0xFF1E325C),
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        // print('yes');
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => FindDevicesScreen(),
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
                            'assets/arrow.jpeg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Text(
                //   'Melomotion',
                //   style: TextStyle(fontSize: 25),
                // ),
// Row(
                // children: <Widget>[
                Container(
                  // decoration: BoxDecoration(color: blue),
                  child: StreamBuilder<BluetoothDeviceState>(
                      stream: device.state,
                      initialData: BluetoothDeviceState.connecting,
                      builder: (c, snapshot) {
                        VoidCallback? onPressed;
                        String text;
                        switch (snapshot.data) {
                          case BluetoothDeviceState.connected:
                            onPressed = () => device.disconnect();
                            text = 'Disconnect';

                            break;
                          case BluetoothDeviceState.disconnected:
                            onPressed = () => device.connect();
                            text = 'Connect';
                            break;
                          default:
                            onPressed = null;
                            text = snapshot.data
                                .toString()
                                .substring(21)
                                .toUpperCase();
                            break;
                        }

                        return Container(
                          child: GestureDetector(
                            onTap: onPressed,
                            child: Material(
                              borderRadius: BorderRadius.circular(40),
                              shadowColor: orange,
                              color: blue,
                              elevation: 3,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 8),
                                  child: Text(
                                    text,
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
                        );
                        // FlatButton(
                        //   // color: orange,
                        //   onPressed: onPressed,
                        //   child: Text(
                        //     text,
                        //     style: Theme.of(context)
                        //         .primaryTextTheme
                        //         .button
                        //         ?.copyWith(color: Colors.white),
                        //   ),
                        // );
                      }),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   'melomotion',
          //   style: TextStyle(fontSize: 25),
          // ),
          Container(
            child: Text(
              'Please face the camera whilst\nperforming the movement',
              style: TextStyle(
                color: blue,
                fontSize: 22,
                fontFamily: 'Museo',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
// ------------- MAIN BIT ---------------
          Column(
            children: <Widget>[
// ------------- REPS ---------------
              StreamBuilder<List<BluetoothService>>(
                stream: device.services,
                initialData: [],
                builder: (c, snapshot) {
                  return Column(
                    children: _buildServiceTiles(snapshot.data!),
                  );
                },
              ),
// ------------- TIMER ---------------
            ],
          ),
          SizedBox(
            height: 10,
          ),

//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
// // ------------- START MUSIC ---------------
//                 Expanded(
//                   child: Container(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Music On Tap Function
//                       },
//                       child: Material(
//                         borderRadius: BorderRadius.circular(40),
//                         shadowColor: orange,
//                         color: blue,
//                         elevation: 3,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Text(
//                               'Start Music',
//                               style: TextStyle(
//                                 color: white,
//                                 //fontFamily: 'Museo',
//                                 fontSize: 24,
//                                 //fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
// // ------------- START COUNTING REPS ---------------
//                 Expanded(
//                   child: Container(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Music On Tap Function
//                       },
//                       child: Material(
//                         borderRadius: BorderRadius.circular(40),
//                         shadowColor: orange,
//                         color: green,
//                         elevation: 3,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Text(
//                               'Start Counting',
//                               style: TextStyle(
//                                 color: white,
//                                 //fontFamily: 'Museo',
//                                 fontSize: 24,
//                                 //fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
        ],
      ),
    );
  }
}
