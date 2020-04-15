import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/set_devices_u/set_devices_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';


class SmartDeviceManager {
  SetDevicesU _setDevicesUsecase;
  CloudValueChangeU _cloudValueChangeUsecases;
  SmartServerU _smartServerUsecase;

  SmartDeviceManager() {
    MySingleton();
    _setDevicesUsecase = SetDevicesU();
    _setDevicesUsecase
        .setAllDevices(); //  Setting up all the device from the memory

    _cloudValueChangeUsecases = CloudValueChangeU();
    _smartServerUsecase = SmartServerU();

    SmartDeviceMainAsync();
  }

  Future SmartDeviceMainAsync() async {
    print(await getIps());

//    _cloudValueChangeUsecases.listenToDataBase(); //  Listen to changes in the database for this device

//    _hotKeyword.startListeningToVoiceCommandForever(); // Listen to voice command does not work inside snap, alsa not working as root inside the snap

    _smartServerUsecase
        .waitForConnection(); //  Start listen for in incoming connections from the local internet (LAN/Wifi)
  }
}
