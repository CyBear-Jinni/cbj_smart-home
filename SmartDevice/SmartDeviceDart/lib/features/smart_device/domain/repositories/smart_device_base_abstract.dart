import 'dart:io';

import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/core/permissions/permissions_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/wish_classes/off_wish.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/wish_classes/on_wish.dart';
import 'package:SmartDeviceDart/injection.dart';


//  The super base class of all the smart device class and smart device abstract classes
abstract class SmartDeviceBaseAbstract {


  DeviceInformation deviceInformation = LocalDevice('This is the mac Address',
      'This is the name of the device'); //  Save data about the device, remote or local IP or pin number
  String deviceName; //  Default name of the device to show in the app
  final String macAddress; //  Mac addresses of the physical device
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
  false; //  Save the device state on = true, off = false of onOffPin
  PinInformation onOffPin; //  Number of on or off pin
  PinInformation onOffButtonPin; //  Pin for the button that control the onOffPin
  final List<PinInformation> _gpioPinList = <PinInformation>[
  ]; //  Save all the gpio pins that this instance is using


  SmartDeviceBaseAbstract(this.macAddress, this.deviceName, int onOffPinNumber,
      {int onOffButtonPinNumber}) {
    onOffPin =
    onOffPinNumber == null ? null : addPinToGpioPinList(onOffPinNumber);

    //  If pin number was inserted and it exists than listen to button press
    if (onOffButtonPinNumber != null) {
      onOffButtonPin = addPinToGpioPinList(onOffButtonPinNumber);

      if(onOffButtonPin != null) {
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
//      return 'Device information is missing, can't turn on';
//    }
    OnWish.setOn(deviceInformation, pinNumber);
    onOff = true;
    return 'Turn on sucsessfuly';
  }

  //  Turn off the device basic action
  String _SetOff(PinInformation pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, can't turn off';
//    }
    OffWish.setOff(deviceInformation, pinNumber);
    onOff = false;
    return 'Turn off sucsessfuly';
  }

  //  Turn device pin to the opposite state
  String _SetChangeOppositeToState(PinInformation pinNumber) {
    return onOff ? _SetOff(onOffPin) : _SetOn(onOffPin);
  }



  //  More functions


  //  Add gpio pin for this device
  PinInformation addPinToGpioPinList(int pinNumber) {
    //  Check if pin is free to be taken, if not return negative number with error number
    var gpioPin = DevicePinListManager.getGpioPin(this, pinNumber);
    if (gpioPin == null) {
      return null;
    }
    _gpioPinList.add(gpioPin);
    return gpioPin;
  }

  //  Return PossibleWishes object if string wish exist (in general) else return null
  WishEnum convertWishStringToWishesObject(String wish) {
    for (var possibleWish in WishEnum.values) {
      print('Wish value ' + EnumHelper.wishEnumToString(possibleWish));
      if (EnumHelper.wishEnumToString(possibleWish) == wish) {
        return possibleWish; //  If wish exist return the PossibleWish object
      }
    }
    return null;
  }

  //  Check if wish exist at all if true than check if base abstract have this wish and if true than execute it
  Future<String> executeWish(String wishString) async {
    var wish = convertWishStringToWishesObject(wishString);
    return wishInBaseClass(wish);
  }

  //  All the wishes that are legit to execute from the base class
  String wishInBaseClass(WishEnum wish) {
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
      case WishEnum.SChangeState:
        if (onOffPin == null) {
          return 'Cant chane pin to the opposit state: ' + onOffPin.toString() +
              ' Number';
        }
        return _SetChangeOppositeToState(onOffPin);

      case WishEnum.GState:
        return getDeviceState().toString();
      default:
        return 'Your wish does not exist for this class';
    }
  }

  //  Listen to button press
  void listenToButtonPressed() async {
    getIt<ButtonObjectLocalAbstract>().buttonPressed(
        this, onOffButtonPin, onOffPin);
  }
}
