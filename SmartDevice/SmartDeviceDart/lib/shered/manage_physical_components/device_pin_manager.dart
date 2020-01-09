import 'dart:io';

import 'package:SmartDeviceDart/shered/wish_classes/off_wish.dart';
import 'package:SmartDeviceDart/smart_device/smart_device_objects/abstract_smart_devices/smart_device_base_abstract.dart';

import '../enums.dart';
import 'devices_pin_configuration/device_configuration_base_class.dart';
import 'devices_pin_configuration/nano_pi_duo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo2_configuration.dart';
import 'devices_pin_configuration/nano_pi_neo_configuration.dart';
import 'devices_pin_configuration/pin_information.dart';

//  This class save all the configuration of the pins per device, every device have different pin for each task, and these class will give the correct pin for the task.
//  Also these class will manage unused pins for new connections and will return free pins number for the required task.

//  Also these class manage the pins, and check if this pin is in the type that the user needs (gpio and more),
//  If pin is not in use and in the correct type that user expect it return the number of the pin, else return -1
class DevicePinListManager {
  static PhysicalDeviceType
  physicalDeviceType; //  Will save the type of the current physical device
  static DeviceConfigurationBaseClass
  physicalDevice; //  Will save the current physical device pin configuration


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
    if (physicalDeviceType == null) {}
    print('This device is of type: ' +
        EnumHelper.physicalDeviceTypeToString(physicalDeviceType));
  }


  static Future<String> GetDeviceHostName() async {
    return await Process.run('hostname', ["-s"]).then((ProcessResult result) {
      String hostName = result.stdout;
      hostName = hostName.substring(
          0, hostName.length - 1); //  Removes the invisible new line at the end
      print(hostName);
      return hostName;
    });
  }

  //  Ask for gpio pin, if free return the pin number, else return error number (negative numbers)
  static PinInformation GetGpioPin(SmartDeviceBaseAbstract smartDevice,
      int pinNumber) {
    if (physicalDevice == null) {
      print("Error physical device is null");
      return null;
    }
    try {
      int isGpioFree = physicalDevice.isGpioPinFree(pinNumber);
      if (isGpioFree != 0) {
        return null;
      }

      PinInformation pinInformation = physicalDevice.GetGpioPin(pinNumber);
      OffWish.SetOff(smartDevice.deviceInformation, pinInformation);
      return pinInformation;
    }
    catch (e) {
      print("This is the exeption: " + e.toString());
      return null;
    }
  }

  //  Return physicalDeviceType object if string physicalDeviceType exist (in general) else return null
  static PhysicalDeviceType
  ConvertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
      String physicalDeviceType) {
    //  Loop through all the physical devices types
    for (PhysicalDeviceType physicalDeviceTypeTemp
    in PhysicalDeviceType.values) {
      if (EnumHelper.physicalDeviceTypeToString(physicalDeviceTypeTemp)
          .toLowerCase() ==
          physicalDeviceType.toLowerCase()) {
        return physicalDeviceTypeTemp; //  If physicalDeviceType string exist return the physicalDeviceType enum object
      }
    }
    return null;
  }
}
