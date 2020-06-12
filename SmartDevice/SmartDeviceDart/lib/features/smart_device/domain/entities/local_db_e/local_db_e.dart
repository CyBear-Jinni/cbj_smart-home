import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/local_db_r/local_db_r.dart';

class LocalDbE {
  LocalDbR _localDbR;

  LocalDbE() {
    _localDbR = LocalDbR();
  }

  List<SmartDeviceBaseAbstract> getListOfSmartDevices() {
    List<SmartDeviceBaseAbstract> smartDeviceList =
        List<SmartDeviceBaseAbstract>();
    smartDeviceList.add(_localDbR.getListOfSmartDevices());
    return smartDeviceList;
  }

  void saveAllDevices(List<SmartDeviceBaseAbstract> smartDevicesList) {
    _localDbR.saveAllDevices(smartDevicesList);
  }
}
