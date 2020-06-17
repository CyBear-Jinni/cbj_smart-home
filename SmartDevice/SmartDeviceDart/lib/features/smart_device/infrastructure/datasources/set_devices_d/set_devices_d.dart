import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/bash_commends_d/common_bash_commends_d.dart';

class SetDevicesD {
  Future<String> getCurrentDeviceUUid() {
    return CommonBashCommendsD.getUuidOfCurrentDevice();
  }

  Future<String> getDeviceDefaultConfig() {
    return CommonBashCommendsD.getFileContent('/etc/cbjinni/deviceConfigs.txt');
  }
}
