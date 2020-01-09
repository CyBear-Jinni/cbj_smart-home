import 'package:SmartDeviceDart/shered/enums.dart';
import 'package:SmartDeviceDart/shered/manage_physical_components/button_object.dart';
import 'package:SmartDeviceDart/shered/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/shered/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/shered/wish_classes/blinds_wish.dart';

import '../abstract_smart_devices/smart_device_static_abstract.dart';

class BlindsObject extends SmartDeviceStaticAbstract {


  PinInformation buttonPinUp, blindsUpPin, buttonPinDown, blindsDownPin;


  BlindsObject(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber,
      int blindsUpPin, int upButtonPinNumber, int blindsDownPin, int downButtonPinNumber)
      : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber) {
    this.buttonPinUp = DevicePinListManager.GetGpioPin(this, upButtonPinNumber);
    this.buttonPinDown =
        DevicePinListManager.GetGpioPin(this, downButtonPinNumber);

    this.blindsUpPin = DevicePinListManager.GetGpioPin(this, blindsUpPin);
    this.blindsDownPin = DevicePinListManager.GetGpioPin(this, blindsDownPin);
    listenToTwoButtonsPress();
  }


  @override
  String ExecuteWish(String wishString) {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return WishInBlindsClass(wish);
  }

  //  All the wishes that are legit to execute from the blinds class
  String WishInBlindsClass(WishEnum wish) {
    if (wish == null) return "Your wish does not exist in blinds class";
    if (wish == WishEnum.blindsUp) return BlindsWish.BlindsUp(this);
    if (wish == WishEnum.blindsDown) return BlindsWish.BlindsDown(this);
    if (wish == WishEnum.blindsStop) return BlindsWish.BlindsStop(this);

    return WishInStaticClass(wish);
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
