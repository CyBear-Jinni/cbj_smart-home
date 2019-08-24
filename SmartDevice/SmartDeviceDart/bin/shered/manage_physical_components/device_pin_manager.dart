import '../enums.dart';
import 'devices_pin_configuration/device_configuration_base_class.dart';
import 'devices_pin_configuration/nano_pi_duo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo_configuration.dart';

// This class save all the configuration of the pins per device, every device have different pin number for each task and this class will give the correct pin for the task.
// Also this class will manage unused pins for new connections and will return free pins number for the required task.


// also this class manage the pins, and check if this pin is in the type that the user needs (gpio and more),
// if pin is not in use and in the correct type that user expect it return the number of the pin, else return -1
class DevicePinListManager{

  static PhysicalDeviceType physicalDeviceType;

  DeviceConfigurationBaseClass nanoPiDuo2 = NanoPiDuo2Configuration();
  DeviceConfigurationBaseClass nanoPiNeo = NanoPiNeoConfiguration();
  DeviceConfigurationBaseClass nanoPiNeo2 = NanoPiNeo2Configuration();

  DevicePinListManager(String insertDeviceType){
    physicalDeviceType = ConvertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(insertDeviceType);
    print('This device is of type: ' + EnumHelper.physicalDeviceTypeToString(physicalDeviceType));
  }
}




// Return PossibleWishes object if string wish exist (in general) else return null
PhysicalDeviceType ConvertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(String physicalDeviceType) {
  for (PhysicalDeviceType possibleWish in PhysicalDeviceType.values) {  // Loop through all the options
    if (EnumHelper.physicalDeviceTypeToString(possibleWish) == physicalDeviceType) {
      return possibleWish; // If physicalDeviceType string exist return the physicalDeviceType enum object
    }
  }
  return null;
}