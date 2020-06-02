import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/bash_commends_d/common_bash_commends_d.dart';

class MySingletonHelper {
  static Future<String> getUuidAddress() {
    return CommonBashCommendsD.getUuidAddressOfCurrentDevice();
  }
}
