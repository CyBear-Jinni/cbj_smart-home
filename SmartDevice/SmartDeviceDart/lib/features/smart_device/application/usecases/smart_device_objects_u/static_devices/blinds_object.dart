import 'package:SmartDeviceDart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_static_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/blinds_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';

class BlindsObject extends SmartDeviceStaticAbstract {


  PinInformation buttonPinUp, blindsUpPin, buttonPinDown, blindsDownPin;


  BlindsObject(
      uuid,
      smartInstanceName,
      onOffPinNumber,
      onOffButtonPinNumber,
      int blindsUpPin,
      int upButtonPinNumber,
      int blindsDownPin,
      int downButtonPinNumber)
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber) {
    buttonPinUp = DevicePinListManager().getGpioPin(this, upButtonPinNumber);
    buttonPinDown =
        DevicePinListManager().getGpioPin(this, downButtonPinNumber);

    this.blindsUpPin =
        DevicePinListManager().getGpioPin(this, blindsUpPin);
    this.blindsDownPin =
        DevicePinListManager().getGpioPin(this, blindsDownPin);
    listenToTwoButtonsPress();
  }

  @override
  DeviceType getDeviceType() => DeviceType.Blinds;

  @override
  Future<String> executeWishString(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    return await executeWish(wish, wishSourceEnum);
  }
  
  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInBlindsClass(wishEnum, wishSourceEnum);
  }

  //  All the wishes that are legit to execute from the blinds class
  Future<String> wishInBlindsClass(WishEnum wish,
      WishSourceEnum wishSourceEnum) async {
    if(wish == null) return 'Your wish does not exist in blinds class';
    if (wish == WishEnum.blindsUp) return await BlindsWishU.BlindsUp(this);
    if (wish == WishEnum.blindsDown) return await BlindsWishU.blindsDown(this);
    if (wish == WishEnum.blindsStop) return await BlindsWishU.blindsStop(this);

    return wishInStaticClass(wish, wishSourceEnum);
  }


  void listenToTwoButtonsPress() {
    if (buttonPinUp != null && buttonPinDown != null &&
        blindsUpPin != null && blindsDownPin != null) {
      ButtonObjectLocalU()
          .listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
          this, buttonPinUp, blindsUpPin, buttonPinDown,
          blindsDownPin);
    }
    else {
      print('Cannot listen to blinds, one of the variables is null');
    }
  }
}
