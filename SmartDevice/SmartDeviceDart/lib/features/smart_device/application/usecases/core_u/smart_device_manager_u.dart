import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/local_db_u/local_db_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/set_devices_u/set_devices_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/my_singleton.dart';

class SmartDeviceManagerU {
  SetDevicesU _setDevicesUseCase;
  CloudValueChangeU _cloudValueChangeUseCases;
  SmartServerU _smartServerUseCase;
  LocalDbU _localDbU;

  SmartDeviceManagerU() {
    MySingleton();
    _localDbU = LocalDbU();
    _setDevicesUseCase = SetDevicesU();
    _setDevicesUseCase
        .setAllDevices(); //  Setting up all the device from the memory

    _cloudValueChangeUseCases = CloudValueChangeU();
    _smartServerUseCase = SmartServerU();

    SmartDeviceMainAsync();
  }

  Future SmartDeviceMainAsync() async {
    print(await getIps());

    _cloudValueChangeUseCases
        .listenToDataBase(); //  Listen to changes in the database for this device

//    _hotKeyword.startListeningToVoiceCommandForever(); // Listen to voice command does not work inside snap, alsa not working as root inside the snap

    _smartServerUseCase
        .waitForConnection(); //  Start listen for in incoming connections from the local internet (LAN/Wifi)
  }
}
