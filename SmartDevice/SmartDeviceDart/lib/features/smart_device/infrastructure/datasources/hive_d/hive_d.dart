import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/person.dart';
import 'package:hive/hive.dart';

class HiveD {
  String hiveFolderPath = '/home/jinnme/Documents/hive';

  HiveD() {
    Hive..init(hiveFolderPath);

    Hive.openBox('SmartDevices');
    usePerson();
  }

  Future<String> getPersonName() async {
//    tryMe();
  }

  Future<void> usePerson() async {
    Hive..registerAdapter(PersonAdapter());
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
