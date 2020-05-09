import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/smart_device_manager_u.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/injection.dart';


void main(List<String> arguments) async {
  print('Smart device is activaited');

  String roomName = 'Bar';
  await configureInjection(Env.dev_pc);
  try {
    SharedVariables(arguments[0], roomName);
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
    SharedVariables.setRoomName(roomName);
  }

  //  Getting physical device type from outside, and checking if this device configuration exist
  await DevicePinListManager().setPhysicalDeviceTypeByHostName();

  SmartDeviceManagerU();
}
