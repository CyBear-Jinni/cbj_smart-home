import 'shered/manage_physical_components/device_pin_manager.dart';
import 'shered/shared_variables.dart';
import 'smart_device/smart_device_manager.dart';

main(List<String> arguments) async {
  print("Smart device is activaited");

  try {
    SharedVariables(arguments[0]);
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }

  //  Getting physical device type from out side, and checking if this device configuration exist
  await DevicePinListManager().SetPhysicalDeviceTypeByHostName();

  SmartDeviceManager();
}
