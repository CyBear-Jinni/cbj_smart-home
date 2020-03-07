import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';

class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  static List<SmartDeviceBaseAbstract> smartDevicesList;

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = List<SmartDeviceBaseAbstract>();
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
