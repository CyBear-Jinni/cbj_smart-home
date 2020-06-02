import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/local_db_e/local_db_e.dart';

class LocalDbU {
  LocalDbE _localDbE;

  LocalDbU() {
    _localDbE = LocalDbE();
  }

  List<SmartDeviceBaseAbstract> getListOfSmartDevices() {
//    return _localDbE.getListOfSmartDevices();
    return null;
  }
}
