import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/local_db_u/local_db_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/set_devices_u/set_devices_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/hot_keyword_r/hot_keyword_r.dart';

class SmartDeviceManagerU {
  SetDevicesU _setDevicesUseCase;
  CloudValueChangeU _cloudValueChangeUseCases;
  SmartServerU _smartServerUseCase;
  LocalDbU _localDbU;
  HotKeyWordR _hotKeyWordR;

  SmartDeviceManagerU() {
    MySingleton();
    _localDbU = LocalDbU();
    _setDevicesUseCase = SetDevicesU();
    _cloudValueChangeUseCases = CloudValueChangeU();
    _smartServerUseCase = SmartServerU();
    _hotKeyWordR = HotKeyWordR();

    SmartDeviceMainAsync();
  }

  Future SmartDeviceMainAsync() async {
    List<SmartDeviceBaseAbstract> smartDeviceFromDb =
        await _localDbU.getListOfSmartDevices();

    _setDevicesUseCase.setAllDevices(
        deviceList:
            smartDeviceFromDb); //  Setting up all the device from the memory

    print(await getIps());

    _cloudValueChangeUseCases
        .listenToDataBase(); //  Listen to changes in the database for this device

    _hotKeyWordR
        .startListeningToVoiceCommandForever(); // Listen to voice command does not work inside snap, alsa not working as root inside the snap

    _smartServerUseCase
        .waitForConnection(); //  Start listen for in incoming connections from the local internet (LAN/Wifi)
  }
}
