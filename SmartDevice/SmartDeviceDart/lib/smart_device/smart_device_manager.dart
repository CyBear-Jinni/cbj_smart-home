import 'dart:io';

import 'package:SmartDeviceDart/shered/enums.dart';
import 'package:SmartDeviceDart/shered/shared_variables.dart';
import 'package:SmartDeviceDart/smart_device/smart_device_objects/simple_devices/light_object.dart';

import '../shered/data_base/cloud_manager.dart';
import '../shered/server/smart_server.dart';
import 'smart_device_objects/abstract_smart_devices/smart_device_base_abstract.dart';

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
    try {
      while (true) {
        await listenToVoiceCommand();
        print("Got Voice command");
      }
    }
    catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
    }
  }

  //  Listen to voice commandfgtggg
  Future<int> listenToVoiceCommand() async {
    return await Process.run(
        SharedVariables.getSnapPath() + '/scripts/cScripts/demo',
        [SharedVariables.getSnapPath()]).then((
//          SharedVariables.getSnapPath() + '/scripts/cScripts/demo', [SharedVariables.getSnapPath() + "/scripts/cScripts"]).then((
        ProcessResult results) {
      print(results.stdout.toString());
      if (results.stdout
          .toString()
          .length == 96) {
        return -1;
      }
      print("Recived voice command");
      //RecognitionClass().listenToLightCommend();
      //return;
      (smartDevicesList[0] as LightObject).WishInBaseClass(
          WishEnum.SChangeState);
      return 0;
    });
  }
}
