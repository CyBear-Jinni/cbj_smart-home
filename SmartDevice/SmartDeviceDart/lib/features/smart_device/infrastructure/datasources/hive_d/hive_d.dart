import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/hive_devices_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/person.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_store_d.dart';
import 'package:hive/hive.dart';

class HiveD {
  String hiveFolderPath;
  static bool finishedInitializing;

  HiveD._privateConstructor() {
//    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  factory HiveD() {
    return _instance;
  }

  Future<bool> contractorAsync() async {
    if (finishedInitializing == null) {
      String currentUserName = await MySingleton.getCurrentUserName();
      hiveFolderPath = '/home/' + currentUserName + '/Documents/hive';
      print('Path of hive: ' + hiveFolderPath);
      Hive..init(hiveFolderPath);

      Hive.openBox('SmartDevices');
      Hive.registerAdapter(TokenAdapter());
      Hive..registerAdapter(PersonAdapter());
      Hive..registerAdapter(HiveDevicesDAdapter());
//    usePerson();
      finishedInitializing = true;
    }
    return finishedInitializing;
  }

  Future<void> usePerson() async {
    await finishedInitializing;

    var box = await Hive.openBox('testBox');

    var person = Person()
      ..name = 'Dave'
      ..age = 22;

    await box.put('dave', person);

    print(box.get('dave')); // Dave: 22
  }

  Future<Map<String, List<String>>> getListOfSmartDevices() async {
    bool temp = await contractorAsync();

    var box = await Hive.openBox('SmartDevices');

    HiveDevicesD a = box.get('deviceList');
    print('this is the long long list:' + a.toString()); // Dave: 22
    print('this is the long long list:' +
        a.smartDeviceList.toString()); // Dave: 22
    return a.smartDeviceList;
  }

  Future<void> saveAllDevices(
      Map<String, List<String>> smartDevicesMapList) async {
    await finishedInitializing;

//    String saveDevicePath = hiveFolderPath + '/devices';

    var box = await Hive.openBox('SmartDevices');

    HiveDevicesD hiveDevicesD = HiveDevicesD()
      ..smartDeviceList = smartDevicesMapList;

    await box.put('deviceList', hiveDevicesD);
  }

//  void main() async {
//    var path = hiveFolderPath;
//    Hive
//      ..init(path)
//      ..registerAdapter(PersonAdapter());
//
//    var box = await Hive.openBox('testBox');
//
//    var person = Person()
//      ..name = 'Dave'
//      ..age = 22
//      ..friends = ['Linda', 'Marc', 'Anne'];
//
//    await box.put('dave', person);
//
//    print(box.get('dave')); // Dave: 22
//  }
}
