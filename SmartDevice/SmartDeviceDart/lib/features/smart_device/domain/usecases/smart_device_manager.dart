import 'package:SmartDeviceDart/features/smart_device/data/datasources/fire_store/cloud_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/smart_server.dart';
import 'package:SmartDeviceDart/features/smart_device/data/models/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/smart_device_objects/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/voice_command_abstract.dart';
import 'package:SmartDeviceDart/injection.dart';


class SmartDeviceManager {
  List<SmartDeviceBaseAbstract> smartDevicesList;


  SmartDeviceManager() {
    smartDevicesList = List<SmartDeviceBaseAbstract>();

    SmartDeviceMainAsync();
  }


  Future SmartDeviceMainAsync() async {
    print(await getIps());

    await setAllDevices(); //  Setting up all the device from the memory

    listenToDataBase(); //  Listen to changes in the database for this device

    startListeningToVoiceCommandForever();

    waitForConnection(); //  Start listen for in incoming connections from the local internet (LAN/Wifi)
  }

  //  TODO: Pull the saved devices into the app variables
  //  Setting all the devices from saved data
  void setAllDevices() async {
    //  TODO: insert the number of the pin with class DevicePinListManager to check if pin is free to use and of the right type
    await smartDevicesList
        .add(LightObject("30:23:a2:G3:34", "Guy ceiling light", 11));
//        .add(LightObject("30:23:a2:G3:34", "Guy ceiling light", 11,
//        onOffButtonPinNumber: 16)); // NanoPi Duo2
//        .add(BlindsObject(
//        "30:23:a2:G3:34",
//        "Guy ceiling light",
//        null,
//        //  onOffPinNumber
//        null,
//        //  onOffButtonPinNumber
//        8,
//        //  blindsUpPin
//        10,
//        //  upButtonPinNumber
//        12,
//        //  blindsDownPin
//        14 //  downButtonPinNumber
//    )); // NanoPi Duo2
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    CloudManager cloudManager = CloudManager(smartDevicesList[0]);
    cloudManager.listenToDataBase();
  }

  //  Listening to port and deciding what to do with the response
  void waitForConnection() {
    print("Wait for connection");
    SmartServer smartServer = SmartServer(smartDevicesList);
    smartServer.startListen();
  }

  void startListeningToVoiceCommandForever() async {
    VoiceCommandAbstract voiceCommandAbstract = getIt<VoiceCommandAbstract>();
    while (true) {
      bool voiceOutput = await voiceCommandAbstract.listenToActivateKeyWord();
      print("Recived voice command");
      if (voiceOutput) {
        (smartDevicesList[0] as LightObject).WishInBaseClass(
            WishEnum.SChangeState);
      }
      print("Got Voice command");
    }

  }
}
