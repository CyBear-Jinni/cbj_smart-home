import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/hot_keyword_usecase/hot_keyword_usecase.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/set_devices_usecase/set_devices_usecase.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_server_usecase/smart_server_usecase.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';

import '../cloud_value_change_usecase/cloud_value_change_usecase.dart';

class SmartDeviceManager {
  SetDevicesUsecase _setDevicesUsecase;
  CloudValueChangeUseCase _cloudValueChangeUsecases;
  HotKeywordUsecase _hotKeyword;
  SmartServerUsecase _smartServerUsecase;

  SmartDeviceManager() {
    MySingleton();
    _setDevicesUsecase = SetDevicesUsecase();
    _setDevicesUsecase
        .setAllDevices(); //  Setting up all the device from the memory

    _cloudValueChangeUsecases = CloudValueChangeUseCase();
    _hotKeyword = HotKeywordUsecase();
    _smartServerUsecase = SmartServerUsecase();

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
