import 'package:SmartDeviceDart/features/smart_device/application/usecases/button_object_u/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums.dart';

class ButtonObjectLocalU extends ButtonObjectLocalAbstract {

  @override
  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
                     PinInformation buttonPinNumber, PinInformation lightPin) async {
    var errorCounter = 0;

    try {
      while (true) {
        var returnValue = await buttonObjectRepository.listenToButtonPress(
            buttonPinNumber);

        if (returnValue < 0) {
          errorCounter++;
          if (errorCounter > 10) {
            print('Stop the listening to the button, it failed more than ' +
                  errorCounter.toString() + ' times');
          }
          return;
        }

        if (lightPin.v == 1) {
          await smartDevice.executeWish(WishEnum.SOff, WishSourceEnum.ButtonPress);
        } else {
          await smartDevice.executeWish(WishEnum.SOn, WishSourceEnum.ButtonPress);
        }

        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
    }
  }

  //  Listen to two buttons but work only if one is pressed.
  @override
  void listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber, PinInformation firstLightPin,
      PinInformation secondButtonPinNumber, PinInformation secondLightPin) async
  {
    listenToButtonPressAndDoAction(smartDevice, firstButtonPinNumber,
                                       firstLightPin, secondLightPin, 1);

    listenToButtonPressAndDoAction(smartDevice, secondButtonPinNumber,
                                       firstLightPin, secondLightPin, 2);
  }


  @override
  void listenToButtonPressAndDoAction(SmartDeviceBaseAbstract smartDevice,
                                      PinInformation buttonPinNumber, PinInformation firstLightPin,
                                      PinInformation secondLightPin, int buttonNumber) async {
    while (true) {
      await buttonObjectRepository.listenToButtonPress(buttonPinNumber).then((
          int exitCode) async {
        await changePinsOutput(
            smartDevice, firstLightPin, secondLightPin,
            buttonNumber);
      });
    }
  }

  //  Logic of two buttons that cannot be pressed together
  @override
  Future changePinsOutput(SmartDeviceBaseAbstract smartDevice,
                          PinInformation firstLightPin,
                          PinInformation secondLightPin,
                          int buttonPressNumber) async {
    if (firstLightPin.v == 1 || secondLightPin.v == 1) {
      firstLightPin.onDuration = 0;
      await OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = 0;
      await OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);
    }

    else if (buttonPressNumber == 1) {
      secondLightPin.onDuration = 0;
      await OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);

      firstLightPin.onDuration = -1;
      await OnWishU.setOn(smartDevice.deviceInformation, firstLightPin);
    }

    else if (buttonPressNumber == 2) {
      firstLightPin.onDuration = 0;
      await OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = -1;
      await OnWishU.setOn(smartDevice.deviceInformation, secondLightPin);
    }

    await Future.delayed(const Duration(seconds: 1));
  }
}




