import 'package:SmartDeviceDart/shered/manage_physical_components/button_object.dart';
import 'package:SmartDeviceDart/shered/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/shered/manage_physical_components/devices_pin_configuration/pin_information.dart';

import '../abstract_smart_devices/smart_device_static_abstract.dart';

class BlindsObject extends SmartDeviceStaticAbstract {
  PinInformation buttonPinUp, blindsUpPin, buttonPinDown, blindsDownPin;

  BlindsObject(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber, int upButtonPinNumber,
      int blindsUpPin, int downButtonPinNumber, int blindsDownPin)
      : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber) {
    this.buttonPinUp = DevicePinListManager.GetGpioPin(this, upButtonPinNumber);
    this.buttonPinDown =
        DevicePinListManager.GetGpioPin(this, downButtonPinNumber);

    this.blindsUpPin = DevicePinListManager.GetGpioPin(this, blindsUpPin);
    this.blindsDownPin = DevicePinListManager.GetGpioPin(this, blindsDownPin);
    listenToTwoButtonsPress();
  }


  void listenToTwoButtonsPress() {
    if (buttonPinUp != null && buttonPinDown != null &&
        blindsUpPin != null && blindsDownPin != null) {
      ButtonObject().listenToTwoButtonPressedButtNotBoth(
          this, buttonPinUp, blindsUpPin, buttonPinDown,
          blindsDownPin);
    }
    else {
      print("Cannot listen to blinds, one of the variables is null");
    }
  }
}
