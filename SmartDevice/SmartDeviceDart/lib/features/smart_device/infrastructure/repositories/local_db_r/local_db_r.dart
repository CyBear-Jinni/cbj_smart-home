import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/local_db_d/local_db_d.dart';

class LocalDbR {
  LocalDbD _localDbD;

  LocalDbR() {
    _localDbD = LocalDbD();
  }

  SmartDeviceBaseAbstract getListOfSmartDevices() {
    SmartDeviceBaseAbstract smartDeviceBaseAbstract;
    // Todo: add all devices that are saved in hive
    _localDbD.getListOfSmartDevices();
    return smartDeviceBaseAbstract;
  }

  void saveAllDevices(List<SmartDeviceBaseAbstract> smartDevicesList) {
    _localDbD.saveAllDevices(smartDevicesList);
  }
}
