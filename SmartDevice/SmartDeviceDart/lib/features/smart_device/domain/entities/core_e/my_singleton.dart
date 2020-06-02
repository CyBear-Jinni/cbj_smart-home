import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/core_r/my_singleton_helper.dart';

class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  static List<SmartDeviceBaseAbstract> smartDevicesList;
  String macAddress;

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = <SmartDeviceBaseAbstract>[];
    getUuidAddress();
  }

  Future<String> getUuidAddress() async {
    return MySingletonHelper.getUuidAddress();
//    /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"
//
//    print('Start');
//
//    await Process.run('cp', ['/sbin/blkid', '.']).then((ProcessResult result) {
//      print(result.stdout);
//      return result.stdout; //  This is mock mac address
//    });

//    // Simple echo command
//    // Somehow windows requires runInShell for the system commands
//    bool runInShell = Platform.isWindows;
//
//    // Run the command
//    await run('blkid', ['|', 'echo', 'a'], runInShell: runInShell, workingDirectory: '/').then((ProcessResult value) => {
//
//    print('Output: ' + value.stdout.toString())
//
//    });
////    await run('/sbin/blkid ', ['|', 'echo', 'a'], runInShell: runInShell, workingDirectory: '/');
//
//
//
//    print('The end');
//
//
//    print('This is the mac address');
//    var shell = Shell();
//
//    await shell.run('''blkid > mac.txt
//''').then((List<ProcessResult> value) => {
//  print('Answer is: ' + value.toString()),
//      value.forEach((element) {
//        print(element.stdout.toString());
//      })
//    });
////        .then((ProcessResult result) async {
////      print('I am in');
////      print(result.stdout);
////      return result.stdout; //  This is mock mac address
////    });
//    print('This was the mac');
//    return null;
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
