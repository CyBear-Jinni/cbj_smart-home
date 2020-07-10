import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/core/helper_methods.dart';
import 'package:SmartDeviceDart/core/permissions/permissions_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/cloud_value_change_e/cloud_value_change_e.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/smart_device_objects_r/smart_device_objects_r.dart';

//  The super base class of all the smart device class and smart device abstract classes
abstract class SmartDeviceBaseAbstract {


  DeviceInformation deviceInformation = LocalDevice('This is the mac Address',
      'This is the name of the device'); //  Save data about the device, remote or local IP or pin number
  String smartInstanceName; //  Default name of the device to show in the app
  final String uuid; //  Mac addresses of the physical device
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
  PinInformation
      onOffButtonPin; //  Pin for the button that control the onOffPin
  final List<PinInformation> _gpioPinList =
      <PinInformation>[]; //  Save all the gpio pins that this instance is using
  CloudValueChangeE _cloudValueChangeE;
  DeviceType smartDeviceType; //  The type of the smart device Light blinds etc

  SmartDeviceBaseAbstract(this.uuid, this.smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber}) {
    onOffPin =
        onOffPinNumber == null ? null : addPinToGpioPinList(onOffPinNumber);

    //  If pin number was inserted and it exists than listen to button press
    if (onOffButtonPinNumber != null) {
      onOffButtonPin = addPinToGpioPinList(onOffButtonPinNumber);

      if (onOffButtonPin != null) {
        listenToButtonPressed();
      }
    }
    _cloudValueChangeE = CloudValueChangeE();
  }

  //  Getters


  //  Get smart device type
  DeviceType getDeviceType() => smartDeviceType;


  Future<String> getIp() async {
    return await getIps();
  }

  //  Get the list of gpio pin of the device
  List<PinInformation> getGpioPinList() {
    return _gpioPinList;
  }


  Future<String> getUuid() {
    return SmartDeviceObjectsR.getUuid();
  }


  bool getDeviceState() => onOff;


  //  Setters


  //  Turn on the device basic action
  String _SetOn(PinInformation pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, can't turn on';
//    }
    OnWishU.setOn(deviceInformation, pinNumber);
    onOff = true;
    return 'Turn on sucsessfuly';
  }

  //  Turn off the device basic action
  String _SetOff(PinInformation pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, can't turn off';
//    }
    OffWishU.setOff(deviceInformation, pinNumber);
    onOff = false;
    return 'Turn off sucsessfuly';
  }


  void setDeviceType(DeviceType deviceType) => smartDeviceType = deviceType;


  //  Turn device pin to the opposite state
  String _SetChangeOppositeToState(PinInformation pinNumber) {
    return onOff ? _SetOff(onOffPin) : _SetOn(onOffPin);
  }


  //  More functions


  //  Add gpio pin for this device
  PinInformation addPinToGpioPinList(int pinNumber) {
    //  Check if pin is free to be taken, if not return negative number with error number
    var gpioPin = DevicePinListManager().getGpioPin(
        this, pinNumber);
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
  Future<String> executeWishString(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    return executeWish(wish, wishSourceEnum);
  }

  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInBaseClass(wishEnum, wishSourceEnum);
  }
  
  //  All the wishes that are legit to execute from the base class
  String wishInBaseClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    if (wish == null) return 'Your wish does not exist';

    bool deviceStatus = getDeviceState();
    String resultOfTheWish;

    switch (wish) {
      case WishEnum.SOff:
        if (onOffPin == null) {
          return 'Cant turn off this pin: ' + onOffPin.toString() + ' Number';
        }
        resultOfTheWish = _SetOff(onOffPin);
        break;
      case WishEnum.SOn:
        if (onOffPin == null) {
	        return 'Cant turn on this pin: ' + onOffPin.toString() + ' Number';
        }
        resultOfTheWish = _SetOn(onOffPin);
        break;
      case WishEnum.SChangeState:
        if (onOffPin == null) {
          return 'Cant chane pin to the opposit state: ' + onOffPin.toString() +
              ' Number';
        }
        resultOfTheWish = _SetChangeOppositeToState(onOffPin);
        break;
      case WishEnum.GState:
        return deviceStatus.toString();
      default:
        return 'Your wish does not exist for this class';
    }

    if (deviceStatus != getDeviceState() &&
        wishSourceEnum != WishSourceEnum.FireBase) {
      updateCloudValue(getDeviceState().toString());
    }

    return resultOfTheWish;
  }

  void updateCloudValue(String value) {
    _cloudValueChangeE.updateDocument(smartInstanceName, value);
  }

  //  Listen to button press
  void listenToButtonPressed() async {
    ButtonObjectLocalU().buttonPressed(this, onOffButtonPin, onOffPin);
  }
}
