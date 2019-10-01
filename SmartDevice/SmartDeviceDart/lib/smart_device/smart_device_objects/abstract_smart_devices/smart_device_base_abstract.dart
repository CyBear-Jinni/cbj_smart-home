import 'dart:io';

import 'package:SmartDeviceDart/shered/manage_physical_components/devices_pin_configuration/pin_information.dart';

import '../../../shered/device_information.dart';
import '../../../shered/enums.dart';
import '../../../shered/manage_physical_components/button_object.dart';
import '../../../shered/manage_physical_components/device_pin_manager.dart';
import '../../../shered/permissions/permissions_manager.dart';
import '../../../shered/server/smart_server.dart';
import '../../../shered/wish_classes/off_wish.dart';
import '../../../shered/wish_classes/on_wish.dart';

//  The super base class of all the smart device class and smart device abstract classes
abstract class SmartDeviceBaseAbstract {
  DeviceInformation deviceInformation = LocalDevice('This is the mac Address',
      'This is the name of the device'); //  Save data about the device, remote or local IP or pin number
  String deviceName; //  Default name of the device to show in the app
  final String macAddress; //  Mac address of the physical device
  Map<String, PermissionsManager>
  devicePermissions; //  Permissions of all the users to this device
  double watts; //  Power consumption of the device
  DateTime
      computerActiveTime; //  How much time the computer is on since last boot
  DateTime
  activeTimeTotal; //  How much time the smart device was active (Doing action) total
  Map<DateTime, Function>
  activitiesLog; //  Log of all the actions the device was and will do
  bool onOff =
  false; //  Save the device state  on = true, off = false of onOffPin
  PinInformation onOffPin; //  Number of on or off pin
  PinInformation onOffButtonPin; //  Pin for the button that control the onOffPin
  List<PinInformation> _gpioPinList = List<
      PinInformation>(); //  Save all the gpio pins that this instance is using

  SmartDeviceBaseAbstract(this.macAddress, this.deviceName, int onOffPinNumber,
      {int onOffButtonPinNumber}) {

    this.onOffPin = AddPinToGpioPinList(onOffPinNumber);

    //  If pin number was inserted and it exist than listen to button press
    if (onOffButtonPinNumber != null) {
      this.onOffButtonPin = AddPinToGpioPinList(onOffButtonPinNumber);

      if (this.onOffButtonPin != null) {
        listenToButtonPressed();
      }
    }
  }

  //  Getters

  //  Get smart device type
  DeviceType getDeviceType() => null;

  Future<String> getIp() async {
    return await getIps();
  }

  //  Get the list of gpio pin of the device
  List<PinInformation> getGpioPinList() {
    return _gpioPinList;
  }

  //  TODO: Make the function return the mac address
  String getMacAddress() {
    Process.run('ls', ['-la']).then((ProcessResult result) {
      print(result.stdout);
      return result.stdout; //  This is mock mac address
    });
    return null;
  }

  bool getDeviceState() => onOff;

  //  Setters

  //  Turn on the device basic action
  String _SetOn(PinInformation pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, cant turn on';
//    }
    OnWish.SetOn(deviceInformation, pinNumber);
    onOff = true;
    return 'Turn on sucsessfuly';
  }

  //  Turn off the device basic action
  String _SetOff(PinInformation pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, cant turn off';
//    }
    OffWish.SetOff(deviceInformation, pinNumber);
    onOff = false;
    return 'Turn off sucsessfuly';
  }

  //  More functions

  //  Add gpio pin for this device
  PinInformation AddPinToGpioPinList(int pinNumber) {
    //  Check if pin is free to be taken, if not return negative number with error number
    PinInformation gpioPin = DevicePinListManager.GetGpioPin(this, pinNumber);
    if (gpioPin == null) {
      return null;
    }
    _gpioPinList.add(gpioPin);
    return gpioPin;
  }

  //  Return PossibleWishes object if string wish exist (in general) else return null
  WishEnum ConvertWishStringToWishesObject(String wish) {
    for (WishEnum possibleWish in WishEnum.values) {
      print('Wish value ' + EnumHelper.wishEnumToString(possibleWish));
      if (EnumHelper.wishEnumToString(possibleWish) == wish) {
        return possibleWish; //  If wish exist return the PossibleWish object
      }
    }
    return null;
  }

  //  Check if wish exist at all if true than check if base abstract have this wish and if true than execute it
  String ExecuteWish(String wishString) {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return WishInBaseClass(wish);
  }

  //  All the wishes that are legit to execute from the base class
  String WishInBaseClass(WishEnum wish) {
    if (wish == null) return 'Your wish does not exist';

    switch (wish) {
      case WishEnum.SOff:
        if (onOffPin == null) {
          return 'Cant turn off this pin: ' + onOffPin.toString() + ' Number';
        }
        return _SetOff(onOffPin);
      case WishEnum.SOn:
        if (onOffPin == null) {
          return 'Cant turn off this pin: ' + onOffPin.toString() + ' Number';
        }
        return _SetOn(onOffPin);
      case WishEnum.GState:
        return getDeviceState().toString();
      default:
        return 'Your wish does not exist for this class';
    }
  }

  //  Listen to button press
  void listenToButtonPressed() async {
    ButtonObject().buttonPressed(this, onOffButtonPin, onOffPin);
  }
}
