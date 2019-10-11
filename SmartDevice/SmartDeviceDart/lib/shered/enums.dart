enum DeviceType {
  Light, //  Light ON/OFF
  DynamicLight, //  Light with brightness 0% to 100%
  Blinds,
  Thermostat,
  Fan,
  AirConditioner,
  Camera,
  Fridge,
  Toaster,
  CoffeeMachine,
  SmartTV,
  RCAirplane,
  RCCar,
  Speakers,
  Roomba, //  Cleaning robot
  Irrigation, //  Give water to plants
  SmartBed,
  AnimalTracker,
  SmartCar
}

//  List of all the wishes that can be made
enum WishEnum {
  SOn, //  Turn the device on
  SOff, //  Turn the device off
  SDynamic, //  Set Dynamic Value
  ODynamic, //  Open connection to change dynamic value
  SMovement, //  Open connection to change dynamic value
  GState, //  Get device state on/off
  blindsUp, //  Turn the blinds up
  blindsDown, //  Turn the blinds Down
  blindsStop //  Stop the blinds
}

//  List of all physical devices types
enum PhysicalDeviceType { NanoPiDuo2, NanoPiNeo, NanoPiNeo2 }

class EnumHelper {
  //  Convert deviceType to string
  static String DeviceTypeToString(DeviceType deviceType) {
    return deviceType.toString().replaceAll('DeviceType.', '');
  }

  //  Convert wishEnum to string
  static String wishEnumToString(WishEnum deviceType) {
    return deviceType.toString().replaceAll('WishEnum.', '');
  }

  //  Convert physicalDeviceType to string
  static String physicalDeviceTypeToString(PhysicalDeviceType deviceType) {
    return deviceType.toString().replaceAll('PhysicalDeviceType.', '');
  }
}
