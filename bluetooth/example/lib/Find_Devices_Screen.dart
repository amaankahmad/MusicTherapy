import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/Bluetooth_Off_Screen.dart';
import 'package:flutter_blue_example/Device_Screen.dart';
import 'package:flutter_blue_example/widgets.dart';

class FindDevicesScreen extends StatelessWidget {
  final orange = const Color(0xFFF57E00);
  final green = const Color(0xFF04A489);
  final blue = const Color(0xFF1E325C);
  final white = const Color(0xFFFFFBF2);
  final yellow = const Color(0xFFFFC247);
  final honeydew = const Color(0xFFF1FAEE);
  // final height = MediaQuery.of(context).size.height;
  // final width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
//----------------- APP BAR ----------------------
      // appBar: AppBar(
      //   title: Text(
      //     'Find Devices',
      //     style: TextStyle(color: honeydew),
      //   ),
      //   backgroundColor: orange,
      // ),
//----------------- REFRESH ----------------------
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Center(
            child: Container(
              child: Text(
                'Find Devices',
                style: TextStyle(color: orange, fontSize: 28),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RefreshIndicator(
            onRefresh: () =>
                FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),
            //----------------- SHOW DEVICES AVAILABLE ----------------------
            child: Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      StreamBuilder<List<BluetoothDevice>>(
                        stream: Stream.periodic(Duration(seconds: 2)).asyncMap(
                            (_) => FlutterBlue.instance.connectedDevices),
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map(
                                (device) => ListTile(
                                  title: Text(device.name),
                                  subtitle: Text(device.id.toString()),
                                  trailing: StreamBuilder<BluetoothDeviceState>(
                                    stream: device.state,
                                    initialData:
                                        BluetoothDeviceState.disconnected,
                                    builder: (c, snapshot) {
                                      if (snapshot.data ==
                                          BluetoothDeviceState.connected) {
                                        //----------------- ALREADY CONNECTED ----------------------
                                        return Container(
                                          height: 30,
                                          width: 90,
                                          child: Container(
                                            child: GestureDetector(
                                              onTap: () => {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DeviceScreen(
                                                            device: device),
                                                  ),
                                                ),
                                                device.discoverServices()
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                shadowColor: orange,
                                                color: green,
                                                elevation: 3,
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 2),
                                                    child: Text(
                                                      'Open',
                                                      style: TextStyle(
                                                        color: white,
                                                        // fontFamily: 'Museo',
                                                        fontSize: 20,
                                                        //fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //  RaisedButton(
                                          //   child: Text('OPEN'),
                                          //   onPressed: () => {
                                          //     Navigator.of(context).push(
                                          //       MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             DeviceScreen(
                                          //                 device: device),
                                          //       ),
                                          //     ),
                                          //     device.discoverServices()
                                          //   },
                                          // ),
                                        );
                                        //                       Expanded(
                                        //   child: Container(
                                        //     child: GestureDetector(
                                        //       onTap: widget.onNotificationPressed,
                                        //       child: Material(
                                        //         borderRadius: BorderRadius.circular(40),
                                        //         shadowColor: orange,
                                        //         color: green,
                                        //         elevation: 3,
                                        //         child: Center(
                                        //           child: Padding(
                                        //             padding: const EdgeInsets.symmetric(vertical: 12),
                                        //             child: Text(
                                        //               'Start Counting',
                                        //               style: TextStyle(
                                        //                 color: white,
                                        //                 // fontFamily: 'Museo',
                                        //                 fontSize: 20,
                                        //                 //fontWeight: FontWeight.w700,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      }
                                      return Text(snapshot.data.toString());
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      StreamBuilder<List<ScanResult>>(
                        stream: FlutterBlue.instance
                            .scanResults, // Initialises the flutterblue stream of devices
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map(
                                (r) => ScanResultTile(
                                  result: r,
                                  // onTap: () => {
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //       builder: (context) {
                                  //         r.device.connect();
                                  //         return DeviceScreen(device: r.device);
                                  //       },
                                  //     ),
                                  //   ),
                                  //   r.device.discoverServices()
                                  // },
                                  onTap: () => {
                                    r.device.connect(),
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DeviceScreen(device: r.device),
                                      ),
                                    ),
                                    sleep(
                                      Duration(milliseconds: 400),
                                    ),
                                    r.device.discoverServices()
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
//----------------- SEARCH BUTTON ----------------------
            return FloatingActionButton(
              backgroundColor: orange,
              child: Icon(Icons.search),
              onPressed: () => FlutterBlue.instance.startScan(
                timeout: Duration(seconds: 4),
              ),
            );
          }
        },
      ),
    );
  }
}
