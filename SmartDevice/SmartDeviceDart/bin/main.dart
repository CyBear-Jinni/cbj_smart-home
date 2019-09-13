import 'shered/manage_physical_components/device_pin_manager.dart';
import 'shered/shared_variables.dart';
import 'smart_device/smart_device_manager.dart';

main(List<String> arguments) async {
  print("Smart device is activaited");

  try {
    SharedVariables(arguments[1]);
  }
  catch(error){
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
  
  //  Getting physical device type from out side, and checking if this device configuration exist
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