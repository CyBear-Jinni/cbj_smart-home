import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';

class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  static List<SmartDeviceBaseAbstract> smartDevicesList;
  String mackAddress;

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = <SmartDeviceBaseAbstract>[];
    getMackAddress();
  }

  Future<String> getMackAddress() async {
//    /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"

    print('This is the mack address');
    await Process.run('/sbin/blkid', ['echo', 'a'])
        .then((ProcessResult result) {
      print('I am in');
      print(result.stdout);
      return result.stdout; //  This is mock mac address
    });
    print('This was the mack');
    return null;
  }

  static void setSmartDevicesList(
      List<SmartDeviceBaseAbstract> smartDeviceListVal) {
    smartDevicesList = smartDeviceListVal;
  }

  static void addToSmartDevicesList(SmartDeviceBaseAbstract smartDeviceVal) {
    smartDevicesList.add(smartDeviceVal);
  }

  static List<SmartDeviceBaseAbstract> getSmartDevicesList() =>
      smartDevicesList;
}
