import 'dart:io';

import '../enums.dart';
import 'devices_pin_configuration/device_configuration_base_class.dart';
import 'devices_pin_configuration/nano_pi_duo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo_configuration.dart';

//  This class save all the configuration of the pins per device, every device have different pin number for each task and this class will give the correct pin for the task.
//  Also this class will manage unused pins for new connections and will return free pins number for the required task.


//  Also this class manage the pins, and check if this pin is in the type that the user needs (gpio and more),
//  If pin is not in use and in the correct type that user expect it return the number of the pin, else return -1
class DevicePinListManager {

  static PhysicalDeviceType physicalDeviceType; //  Will save the type of the current physical device
  static DeviceConfigurationBaseClass physicalDevice; //  Will save the current physical device pin configuration


  Future SetPhysicalDeviceTypeByHostName() async {
    String deviceHostName = await GetDeviceHostName();
    deviceHostName = deviceHostName.replaceAll("-", "").replaceAll(" ", "");

    physicalDeviceType =
        ConvertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
            deviceHostName);
    print("phyc type is" + physicalDevice.toString());
    //  Save the current physical device configuration to the physicalDevice variable
    switch (physicalDeviceType) {
      case PhysicalDeviceType.NanoPiDuo2:
        {
          physicalDevice = NanoPiDuo2Configuration();
          break;
        }
      case PhysicalDeviceType.NanoPiNeo:
        {
          physicalDevice = NanoPiNeoConfiguration();
          break;
        }
      case PhysicalDeviceType.NanoPiNeo2:
        {
          physicalDevice = NanoPiNeo2Configuration();
          break;
        }
    }
    if (physicalDeviceType == null) {
    }
    print('This device is of type: ' +
        EnumHelper.physicalDeviceTypeToString(physicalDeviceType));
  }

  static Future<String> GetDeviceHostName() async {
    return await Process.run('hostname', ["-s"]).then((ProcessResult result) {
      String hostName = result.stdout;
      hostName = hostName.substring(0, hostName.length -1 );  //  Removes the invisible new line at the end
      print(hostName);
      return hostName;
    });
  }

  //  Ask for gpio pin, if free return the pin number, else return error number (negative numbers)
  static int GetGpioPin(int pinNumber) => physicalDevice.GetGpioPin(pinNumber);

  //  Return physicalDeviceType object if string physicalDeviceType exist (in general) else return null
  static PhysicalDeviceType ConvertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
      String physicalDeviceType) {

    //  Loop through all the physical devices types
    for (PhysicalDeviceType physicalDeviceTypeTemp in PhysicalDeviceType
        .values) {
      if (EnumHelper.physicalDeviceTypeToString(physicalDeviceTypeTemp) ==
          physicalDeviceType) {
        return physicalDeviceTypeTemp; //  If physicalDeviceType string exist return the physicalDeviceType enum object
      }
    }
    return null;
  }
}

