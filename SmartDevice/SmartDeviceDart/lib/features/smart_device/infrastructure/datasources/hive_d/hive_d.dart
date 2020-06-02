import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/bash_commends_d/common_bash_commends_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_store_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/person.dart';
import 'package:hive/hive.dart';

class HiveD {
  HiveD._privateConstructor() {
    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  factory HiveD() {
    return _instance;
  }

  Future<void> contractorAsync() async {
    String currentUserName = await CommonBashCommendsD.getCurrentUserName();
    String hiveFolderPath = '/home/' + currentUserName + '/Documents/hive';
    print('Path of hive: ' + hiveFolderPath);
    Hive..init(hiveFolderPath);

    Hive.openBox('SmartDevices');
    Hive.registerAdapter(TokenAdapter());
    Hive..registerAdapter(PersonAdapter());
//    usePerson();
  }

  Future<String> getPersonName() async {
//    tryMe();
  }

  Future<void> usePerson() async {
    var box = await Hive.openBox('testBox');

    var person = Person()
      ..name = 'Dave'
      ..age = 22;

    await box.put('dave', person);

    print(box.get('dave')); // Dave: 22
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
