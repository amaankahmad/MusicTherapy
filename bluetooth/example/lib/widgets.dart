// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

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
      trailing: RaisedButton(
        child: Text('CONNECT'),
        color: blue,
        textColor: Colors.white,
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
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

class CharacteristicTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: characteristic.value,
      initialData: characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        var reps = 0;
        if (value?.length != 0) {
          reps = value![0];
        } else {
          reps = 0;
        }
        return ExpansionTile(
          title: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Rep Counter'),
                // Text(
                //     '0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}',
                //     style: Theme.of(context).textTheme.body1?.copyWith(
                //         color: Theme.of(context).textTheme.caption?.color))
              ],
            ),
            subtitle: Text(reps.toString()),
            contentPadding: EdgeInsets.all(0.0),
          ),
          trailing: Row(
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
                    characteristic.isNotifying
                        ? Icons.sync_disabled
                        : Icons.sync,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
                // onPressed: () => {
                //   onNotificationPressed,
                //   // Music play
                // },
                onPressed: onNotificationPressed,
              )
            ],
          ),
          children: descriptorTiles,
        );
      },
    );
  }
}

class DescriptorTile extends StatelessWidget {
  final BluetoothDescriptor descriptor;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;

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
