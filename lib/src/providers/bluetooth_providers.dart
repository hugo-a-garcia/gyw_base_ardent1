import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bluetoothAdapterStateProvider = StreamProvider<BluetoothAdapterState>((
  ref,
) async* {
  BluetoothAdapterState adapterState = BluetoothAdapterState.unknown;

  await for (var element in FlutterBluePlus.adapterState) {
    adapterState = element;
    yield adapterState;
  }
});

final isAdapterOnProvider = StreamProvider<bool>((ref) async* {
  bool isAdapterOn = false;
  await for (var nextState in FlutterBluePlus.adapterState) {
    isAdapterOn = nextState == BluetoothAdapterState.on ? true : false;
    yield isAdapterOn;
  }
});

final startScanProvider = FutureProvider<void>((ref) async {
  Duration timeout = const Duration(seconds: 3);
  await FlutterBluePlus.startScan(timeout: timeout, oneByOne: true);
});

final scanResultsProvider = StreamProvider<List<String>>((ref) async* {
  ref.watch(startScanProvider);
  Stream<List<ScanResult>> scanResults = FlutterBluePlus.scanResults;

  List<String> scansResultsList = [];
  await for (List<ScanResult> scanResultList in scanResults) {
    for (var element in scanResultList) {
      String advName = element.advertisementData.advName;
      String devId = element.device.remoteId.toString();
      scansResultsList.add('$advName $devId');
      // print('==============');
      // print(scansResultsList);
      // print('<<==============>>');
      yield scansResultsList;
    }
  }
});
