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
    ButtonPressedStateClass buttonPressedState = ButtonPressedStateClass();

    listenToButtonPressAndDoAction(smartDevice, firstButtonPinNumber,
        firstLightPin, secondLightPin, buttonPressedState, 1);

    listenToButtonPressAndDoAction(smartDevice, secondButtonPinNumber,
        firstLightPin, secondLightPin, buttonPressedState, 2);
  }

  void listenToButtonPressAndDoAction(SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber, PinInformation firstLightPin,
      PinInformation secondLightPin,
      ButtonPressedStateClass buttonPressedStateClass, int buttonNumber) async {
    while (true) {
      await listenToButtonPress(firstButtonPinNumber).then((
          int exitCode) async {
        if (buttonNumber == 1) {
          buttonPressedStateClass.firstButtonPressedState =
          !buttonPressedStateClass.firstButtonPressedState;
        }
        else if (buttonNumber == 2) {
          buttonPressedStateClass.secondButtonPressedState =
          !buttonPressedStateClass.secondButtonPressedState;
        }
        await changePinsOutput(
            smartDevice, firstLightPin, secondLightPin,
            buttonPressedStateClass);
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
      ButtonPressedStateClass buttonPressedStateClass) async {
    bool firstButtonPressedState = buttonPressedStateClass
        .firstButtonPressedState;
    bool secondButtonPressedState = buttonPressedStateClass
        .secondButtonPressedState;

    if (firstButtonPressedState && secondButtonPressedState ||
        !firstButtonPressedState && !secondButtonPressedState) {
      buttonPressedStateClass.firstButtonPressedState = false;
      buttonPressedStateClass.secondButtonPressedState = false;

      OffWish.SetOff(smartDevice.deviceInformation, firstLightPin);

      OffWish.SetOff(smartDevice.deviceInformation, secondLightPin);
    }
    else if (firstButtonPressedState) {
      if (firstLightPin.v == 0) {
        OnWish.SetOn(smartDevice.deviceInformation, firstLightPin);
      }
    }
    else if (secondButtonPressedState) {
      if (secondLightPin.v == 0) {
        OnWish.SetOn(smartDevice.deviceInformation, secondLightPin);
      }
    }

    await Future.delayed(const Duration(seconds: 1));
  }
}

class ButtonPressedStateClass {
  bool firstButtonPressedState = false;
  bool secondButtonPressedState = false;
}
