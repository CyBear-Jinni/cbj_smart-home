import 'package:SmartDeviceDart/core/enums.dart';
import 'package:SmartDeviceDart/core/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/core/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/core/wish_classes/blinds_wish.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/pins_datasource/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_static_abstract.dart';
import 'package:SmartDeviceDart/injection.dart';


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
  Future<String> ExecuteWish(String wishString) async {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return await WishInBlindsClass(wish);
  }

  //  All the wishes that are legit to execute from the blinds class
  Future<String> WishInBlindsClass(WishEnum wish) async {
    if (wish == null) return "Your wish does not exist in blinds class";
    if (wish == WishEnum.blindsUp) return await BlindsWish.BlindsUp(this);
    if (wish == WishEnum.blindsDown) return await BlindsWish.BlindsDown(this);
    if (wish == WishEnum.blindsStop) return await BlindsWish.BlindsStop(this);

    return WishInStaticClass(wish);
  }


  void listenToTwoButtonsPress() {
    if (buttonPinUp != null && buttonPinDown != null &&
        blindsUpPin != null && blindsDownPin != null) {
      getIt<ButtonObjectLocalAbstract>()
          .listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
          this, buttonPinUp, blindsUpPin, buttonPinDown,
          blindsDownPin);
    }
    else {
      print("Cannot listen to blinds, one of the variables is null");
    }
  }
}
