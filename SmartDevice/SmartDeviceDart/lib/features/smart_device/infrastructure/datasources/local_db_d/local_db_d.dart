import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_d.dart';

class LocalDbD {
  HiveD _hiveD;

  LocalDbD() {
    _hiveD = HiveD();
  }

  String getListOfSmartDevices() {
    return _hiveD.getListOfSmartDevices();
  }
}
