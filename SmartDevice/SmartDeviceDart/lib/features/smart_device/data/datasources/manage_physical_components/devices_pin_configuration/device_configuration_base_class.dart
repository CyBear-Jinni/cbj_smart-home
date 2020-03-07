import 'dart:core';

import 'pin_information.dart';

//  This class is abstract, it manages all the pins list types both what exist and what in use, getting pin number should be through here
abstract class DeviceConfigurationBaseClass {
  //  Pins types lists
  List<PinInformation> pinList; //  List of all the pins on the device


  //  Getters


  List<PinInformation> getGPIOList() => pinList;

  //  Get the gpio pin if not in used and set it to used, else return null
  PinInformation getGpioPin(int pinNumber) {
    var pinInformation = getPinInformationByPinNumber(pinNumber);

    var isTheGpioPinFree = isGpioPinFree(pinNumber);

    if (isTheGpioPinFree != 0) {
      throw ('Cant use this pin ' + pinNumber.toString() + ' error code ' +
             isTheGpioPinFree.toString());
    }

    pinInformation.isInUse = true;

    return pinInformation;
  }

  // Get PinInformation object that have pin number, if does not exist return null
  PinInformation getPinInformationByPinNumber(int pinNumber) {
    for (var pinInformation in pinList) {
      if (pinInformation.pinAndPhysicalPinConfiguration == pinNumber) {
        return pinInformation;
      }
    }
    return null;
  }


  bool isPinGpio(PinInformation pinInformation) =>
      isPinSpecificCategory(
          pinInformation, 'gpio') && isPinSpecificType(pinInformation, 'gpio');


  bool isPinSpecificCategory(PinInformation pinInformation,
      String pinCategory) {
    var pinCategoryLowerCase = pinCategory.toLowerCase();
    return pinInformation.category.toLowerCase().contains(pinCategoryLowerCase);
  }


  bool isPinSpecificType(PinInformation pinInformation, String pinType) =>
      pinInformation.name.toLowerCase().contains(pinType.toLowerCase());

  //  Get gpio pin number, if pin is gpio and free return the pin number, if pin does not exist return -1, if pin is not gpio pin return -2, if pin is in use as gpio return -3
  int isGpioPinFree(int pinNumber) {
    var pinInformation = getPinInformationByPinNumber(pinNumber);

    //  If pin does not exist return -1
    if (pinInformation == null) {
      return -1;
    }

    //  If pin is not gpio pin return -2
    if (!isPinGpio(pinInformation)) {
      return -2;
    }

    //  If pin is already in use return -3
    if (pinInformation.isInUse) {
      return -3;
    }

    return 0;
  }
}
