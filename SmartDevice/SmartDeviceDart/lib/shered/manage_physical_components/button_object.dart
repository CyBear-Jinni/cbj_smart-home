import 'dart:io';

import 'package:SmartDeviceDart/shered/wish_classes/off_wish.dart';
import 'package:SmartDeviceDart/shered/wish_classes/on_wish.dart';

import '../../smart_device/smart_device_objects/abstract_smart_devices/smart_device_base_abstract.dart';
import '../shared_variables.dart';
import 'devices_pin_configuration/pin_information.dart';

class ButtonObject {
  SmartDeviceBaseAbstract smartDevice;
  int errorCounter = 0;

  ButtonObject(this.smartDevice);

  void buttonPressed(PinInformation buttonPinNumber,
      PinInformation lightPin) async {

    try {
      while (true) {
        int returnValue = await Process.run(
            SharedVariables.getSnapPath() + '/scripts/cScripts/buttonPress',
            [buttonPinNumber.pinAndPhysicalPinConfiguration.toString()]).then((
            ProcessResult results) {
          if (results.stdout
              .toString()
              .length == 96) {
            return -1;
          }
          if (lightPin.v == 1) {
            OffWish.SetOff(smartDevice.deviceInformation, lightPin);
            lightPin.v = 0;
          } else {
            OnWish.SetOn(smartDevice.deviceInformation, lightPin);
            lightPin.v = 1;
          }
          return 0;
        });
        if (returnValue < 0) {
          errorCounter++;
          if (errorCounter > 10) {
            print("Stop the listening to the button, it failed more than " +
                errorCounter.toString() + " times");
            return;
          }
        }
        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
    }
  }
}
