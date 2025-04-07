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
  if (FlutterBluePlus.isScanningNow) await FlutterBluePlus.stopScan();
  Duration timeout = const Duration(seconds: 3);
  await FlutterBluePlus.startScan(
    timeout: timeout,
    oneByOne: true,
    // Uncomment next line to only scan the ardent
    //withServices: [Guid("180A")],
  );
});

typedef AdvertisementDataRecord =
    ({String advName, bool connectable, int? txPowerLevel});

typedef BlueetoothDeviceRecord =
    ({
      String advName,
      bool isAutoConnectedEnabled,
      bool isConnected,
      bool isDiconnedted,
      int mtuNow,
      String platformName,
    });

typedef ScanResultRecord =
    ({
      AdvertisementDataRecord advertisement,
      BlueetoothDeviceRecord blueetoothDeviceRecord,
    });

final scanResultsRecordsProvider = StreamProvider<List<ScanResultRecord>>((
  ref,
) async* {
  ref.watch(startScanProvider);

  Stream<List<ScanResult>> scanResults = FlutterBluePlus.scanResults;

  List<ScanResultRecord> scanResultRecordList = [];

  await for (List<ScanResult> scanResultList in scanResults) {
    for (var scanResult in scanResultList) {
      final AdvertisementData data = scanResult.advertisementData;
      final AdvertisementDataRecord advertisementRecord = (
        advName: data.advName,
        connectable: data.connectable,
        txPowerLevel: data.txPowerLevel,
      );

      final BluetoothDevice device = scanResult.device;

      final BlueetoothDeviceRecord deviceRecord = (
        advName: device.advName,
        isAutoConnectedEnabled: device.isAutoConnectEnabled,
        isConnected: device.isConnected,
        isDiconnedted: device.isDisconnected,
        mtuNow: device.mtuNow,
        platformName: device.platformName,
      );

      ScanResultRecord currrentScanResultRecord = (
        advertisement: advertisementRecord,
        blueetoothDeviceRecord: deviceRecord,
      );
      scanResultRecordList.add(currrentScanResultRecord);
    }
    yield scanResultRecordList;
  }
});
