import 'dart:io';

import 'package:SmartDeviceDart/shered/wish_classes/off_wish.dart';
import 'package:SmartDeviceDart/shered/wish_classes/on_wish.dart';

import '../../smart_device/smart_device_objects/abstract_smart_devices/smart_device_base_abstract.dart';
import '../shared_variables.dart';
import 'devices_pin_configuration/pin_information.dart';

class ButtonObject {

  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation lightPin) async {
    int errorCounter = 0;

    try {
      while (true) {
        int returnValue = await listenToButtonPress(buttonPinNumber);

        if (returnValue < 0) {
          errorCounter++;
          if (errorCounter > 10) {
            print("Stop the listening to the button, it failed more than " +
                errorCounter.toString() + " times");
          }
          return;
        }

        if (lightPin.v == 1) {
          OffWish.SetOff(smartDevice.deviceInformation, lightPin);
        } else {
          OnWish.SetOn(smartDevice.deviceInformation, lightPin);
        }

        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
    }
  }


  //  Listen to two buttons but work only if one is pressed.
  void listenToTwoButtonPressedButtNotBoth(SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber, PinInformation firstLightPin,
      PinInformation secondButtonPinNumber, PinInformation secondLightPin) async
  {

    listenToButtonPressAndDoAction(smartDevice, firstButtonPinNumber,
        firstLightPin, secondLightPin, 1);

    listenToButtonPressAndDoAction(smartDevice, secondButtonPinNumber,
        firstLightPin, secondLightPin, 2);
  }

  void listenToButtonPressAndDoAction(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation firstLightPin,
      PinInformation secondLightPin, int buttonNumber) async {
    while (true) {
      await listenToButtonPress(buttonPinNumber).then((
          int exitCode) async {
        await changePinsOutput(
            smartDevice, firstLightPin, secondLightPin,
            buttonNumber);
      });
    }
  }

  //  Listen to button press and return exist code
  Future<int> listenToButtonPress(PinInformation buttonPinNumber) async {
    return await Process.run(
        SharedVariables.getSnapPath() + '/scripts/cScripts/buttonPress',
        [buttonPinNumber.pinAndPhysicalPinConfiguration.toString()]).then((
        ProcessResult results) {
      if (results.stdout
          .toString()
          .length == 96) {
        return -1;
      }
      return 0;
    });
  }

  //  Logic of two buttons
  Future changePinsOutput(SmartDeviceBaseAbstract smartDevice,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonPressNumber) async {
    if (firstLightPin.v == 1 || secondLightPin.v == 1) {
      firstLightPin.onDuration = 0;
      OffWish.SetOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = 0;
      OffWish.SetOff(smartDevice.deviceInformation, secondLightPin);
    }

    else if (buttonPressNumber == 1) {
      secondLightPin.onDuration = 0;
      OffWish.SetOff(smartDevice.deviceInformation, secondLightPin);

      firstLightPin.onDuration = -1;
      OnWish.SetOn(smartDevice.deviceInformation, firstLightPin);
    }

    else if (buttonPressNumber == 2) {
      firstLightPin.onDuration = 0;
      OffWish.SetOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = -1;
      OnWish.SetOn(smartDevice.deviceInformation, secondLightPin);
    }

    await Future.delayed(const Duration(seconds: 1));
  }
}
