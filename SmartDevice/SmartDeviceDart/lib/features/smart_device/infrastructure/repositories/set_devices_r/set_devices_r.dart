import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/set_devices_d/set_devices_d.dart';

class SetDevicesR {
  SetDevicesD _setDevicesD;

  SetDevicesR() {
    _setDevicesD = SetDevicesD();
  }

  Future<String> getCurrentDeviceUUid() {
    return _setDevicesD.getCurrentDeviceUUid();
  }

  Future<String> getDeviceDefaultConfig() {
    return _setDevicesD.getDeviceDefaultConfig();
  }
}
