import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/usecases/smart_device_manager.dart';
import 'package:SmartDeviceDart/injection.dart';



main(List<String> arguments) async {
  print('Smart device is activaited');
  await configureInjection(Env.dev_pc);
//
//
//  final mockCowAnimal = getIt<AnimalAbstract>();
//  TryItNow tryItNow = TryItNow(mockCowAnimal);
//  print(tryItNow.getLegs());

  try {
    SharedVariables(arguments[0]);
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }

  //  Getting physical device type from outside, and checking if this device configuration exist
  await DevicePinListManager().SetPhysicalDeviceTypeByHostName();

  SmartDeviceManager();
}
