import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:gyw_base_ardent1/src/device/bt_device.dart';

import '../model/drawings.dart';

class DeviceService {
  late final GYWBtDevice _gywBtDevice;

  DeviceService._();

  static final DeviceService _instance = DeviceService._();

  //argument is device name
  factory DeviceService() {
    return _instance;
  }

  Future<void> connectDevice(String remoteId, int rssi) async {
    var device = BluetoothDevice.fromId(remoteId);
    _gywBtDevice = GYWBtDevice(
      fbDevice: device,
      lastRssi: 0,
      lastSeen: DateTime.now(),
    );
    await _gywBtDevice.connect();
    await _gywBtDevice.startDisplay();
  }

  disconnectDevice() async {
    //await _gywBtDevice.stopDisplay(); Not implemented.
    await _gywBtDevice.disconnect();
  }

  Future<void> sendDrawing(List<GYWDrawing> drawings) async {
    for (final GYWDrawing drawing in drawings) {
      await _gywBtDevice.sendDrawing(drawing);
    }
  }
}
