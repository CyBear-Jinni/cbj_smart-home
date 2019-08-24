import 'shered/manage_physical_components/device_pin_manager.dart';
import 'smart_device/smart_device_manager.dart';

main(List<String> arguments) async {
  print('Starting the program');

// Getting physical device type from out side, and checking if this device configuration exist
  try {
    DevicePinListManager(arguments[0]);
    if(DevicePinListManager.physicalDeviceType == null){
      print(arguments[0] + ' device is not supported');
      return;
    }
  } catch(error) {
    print("Device type was not inserted");
    return;
  }

  SmartDeviceManager();

}