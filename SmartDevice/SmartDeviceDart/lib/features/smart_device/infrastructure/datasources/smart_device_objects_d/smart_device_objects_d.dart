import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/bash_commends_d/common_bash_commends_d.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    return CommonBashCommendsD.getUuidOfCurrentDevice();
  }
}
