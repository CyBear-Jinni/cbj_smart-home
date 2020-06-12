import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/hive_devices_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/person.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_store_d.dart';
import 'package:hive/hive.dart';

class HiveD {
  String hiveFolderPath;

  HiveD._privateConstructor() {
    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  factory HiveD() {
    return _instance;
  }

  Future<void> contractorAsync() async {
    String currentUserName = await MySingleton.getCurrentUserName();
    hiveFolderPath = '/home/' + currentUserName + '/Documents/hive';
    print('Path of hive: ' + hiveFolderPath);
    Hive..init(hiveFolderPath);

    Hive.openBox('SmartDevices');
    Hive.registerAdapter(TokenAdapter());
    Hive..registerAdapter(PersonAdapter());
    Hive..registerAdapter(HiveDevicesDAdapter());
//    usePerson();
  }

  Future<void> usePerson() async {
    var box = await Hive.openBox('testBox');

    var person = Person()
      ..name = 'Dave'
      ..age = 22;

    await box.put('dave', person);

    print(box.get('dave')); // Dave: 22
  }

  String getListOfSmartDevices() {
    return null;
  }


  Future<void> saveAllDevices(
      Map<String, List<String>> smartDevicesMapList) async {
//    String saveDevicePath = hiveFolderPath + '/devices';

    var box = await Hive.openBox('SmartDevices');

    HiveDevicesD hiveDevicesD = HiveDevicesD()
      ..smartDeviceList = smartDevicesMapList;

    await box.put('deviceList', hiveDevicesD);


    HiveDevicesD a = box.get('deviceList');
    print('this is the long long list:' + a.toString()); // Dave: 22
    print('this is the long long list:' +
        a.smartDeviceList.toString()); // Dave: 22
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
