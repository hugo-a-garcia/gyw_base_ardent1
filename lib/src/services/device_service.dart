import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:gyw_base_ardent1/src/device/bt_device.dart';

import '../model/drawing_parts/fonts.dart';
import '../model/drawing_parts/icons.dart';
import '../model/drawings.dart';

class DeviceService {
  late final GYWBtDevice gywBtDevice;

  DeviceService._();

  static final DeviceService _instance = DeviceService._();

  //argument is device name
  factory DeviceService() {
    return _instance;
  }

  String printSomething() {
    return 'Hello';
  }

  Future<void> connectDevice(String remoteId, int rssi) async {
    var device = BluetoothDevice.fromId(remoteId);
    gywBtDevice = GYWBtDevice(fbDevice: device, lastRssi: 0);
    await gywBtDevice.connect();
    await gywBtDevice.startDisplay();
    print('DEVICE CONNECTED = ${gywBtDevice.isConnected}');
  }

  Future<void> sendExampleData() async {
    const List<GYWDrawing> drawings = <GYWDrawing>[
      BlankScreen(color: Colors.white),
      IconDrawing(GYWIcon.up, top: 50, left: 60),
      TextDrawing(
        text: "Hello world",
        top: 50,
        left: 220,
        font: GYWFont.medium,
      ),
    ];

    // for (final GYWDrawing drawing in drawings) {
    //   await connectedDevice?.displayDrawing(drawing);
    // }

    for (final GYWDrawing drawing in drawings) {
      await gywBtDevice.sendDrawing(drawing);
    }
  }
}
