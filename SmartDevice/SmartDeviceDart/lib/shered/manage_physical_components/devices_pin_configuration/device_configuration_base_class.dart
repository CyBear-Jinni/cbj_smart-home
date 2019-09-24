import 'dart:core';

//  This class is abstract, it manage all the pins list types both what exist and what in use, getting pin number should be through here
abstract class DeviceConfigurationBaseClass {
  //  Pins can be in multiple lists of types of pins at the same times but cannot be in multiple used pins list at the same time

  //  Pins types lists
  List<int>
  gpioList; //  GPIO pins number to interact with the pin, GPIO pin can receive or output only 1 (electricity) or 0 (no electricity), those pins cannot detect in between.

  //  Pins used types lists
  List<int> _gpioUsedPinsList = List<int>(); //  Save all the used pin numbers

  //  Getters

  List<int> GetGPIOList() => gpioList;

  //  Get gpio pin number, if pin is gpio and free return the pin number, if pin does not exist return -1, if pin is not gpio pin return -2, if pin is in use as gpio return -3, if pin is not in use as gpio return -4

  int GetGpioPin(int pinNumber) {
    //  If pin does not exist in all pin list return -1
    if (!isPinExistOnDevice(pinNumber)) {
      return -1;
    }

    //  If pin is not gpio pin return -2
    if (!gpioList.contains(pinNumber)) {
      return -2;
    }

    //  If pin is already in use return -3
    if (_gpioUsedPinsList.contains(pinNumber)) {
      return -3;
    }
    //  If pin is already in use by another pin type list return -4
    if (isPinInUseByAnotherListType(pinNumber)) {
      return -4;
    }

    _gpioUsedPinsList.add(pinNumber);

    return pinNumber;
  }

  //  This device get pin number and return true if its exist on one of the lists of pins (can be different type of pin)
  bool isPinExistOnDevice(int pinNumber) {
    if (gpioList.contains(pinNumber)) {
      return true;
    }
    return false;
  }

  //  Check if pin in use in another list type
  bool isPinInUseByAnotherListType(int pinNumber) {
    if (_gpioUsedPinsList.contains(pinNumber)) {
      return true;
    }
    return false;
  }
}
