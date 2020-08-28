import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/local_db_e/local_db_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';

class LocalDbU {
  LocalDbE _localDbE;

  LocalDbU() {
    _localDbE = LocalDbE();
  }

  Future<List<SmartDeviceBaseAbstract>> getListOfSmartDevices() async {
    return await _localDbE.getListOfSmartDevices();
  }

  Future<FirebaseAccountsInformationD> getListOfDatabaseInformation() async {
    return await _localDbE.getListOfDatabaseInformation();
  }
}
