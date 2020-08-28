import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/local_db_u/local_db_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/set_devices_u/set_devices_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';

class SmartDeviceManagerU {
  SetDevicesU _setDevicesUseCase;
  SmartServerU _smartServerUseCase;
  LocalDbU _localDbU;

  SmartDeviceManagerU() {
    MySingleton();
    _localDbU = LocalDbU();
    _setDevicesUseCase = SetDevicesU();

    _smartServerUseCase = SmartServerU();

    SmartDeviceMainAsync();
  }

  Future SmartDeviceMainAsync() async {
    List<SmartDeviceBaseAbstract> smartDeviceFromDb = await _localDbU
        .getListOfSmartDevices();
    FirebaseAccountsInformationD firebaseAccountsInformationD = await _localDbU
        .getListOfDatabaseInformation();

    _setDevicesUseCase.setAllDevices(
        deviceList: smartDeviceFromDb); //  Setting up all the device from the memory

    print(await getIps());

    _smartServerUseCase
        .waitForConnection(
        firebaseAccountsInformationD); //  Start listen for in incoming connections from the local internet (LAN/Wifi)
  }
}
