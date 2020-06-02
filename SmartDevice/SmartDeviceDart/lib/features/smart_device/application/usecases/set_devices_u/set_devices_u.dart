import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/my_singleton.dart';

// This class will load all saved smart devices objects from file at startup into the program
class SetDevicesU {
//  TODO: Pull the saved devices into the app variables
  //  Setting all the devices from saved data
  void setAllDevices() {
    //  TODO: insert the number of the pin with class DevicePinListManager to check if pin is free to use and of the right type
    MySingleton.setSmartDevicesList([
      LightObject(
          '30:23:a2:G3:34', 'Stairs', 8, onOffButtonPinNumber: 10),
      LightObject(
          '30:23:a2:G3:34', 'Storage', 12, onOffButtonPinNumber: 14)


//        LightObject('30:23:a2:G3:34', 'Guy ceiling light', 11,
//            onOffButtonPinNumber:
//                2)); // NanoPi Duo2 will be pin 16 for the button


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
//        14 // downButtonPinNumber
//    )); // NanoPi Duo2
    ]);
  }
}
