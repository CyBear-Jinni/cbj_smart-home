import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(TurnPinOnOffAbstract, env: Env.dev_pc)
@injectable
class TurnPinOnOff extends TurnPinOnOffAbstract {
//  Function to start c script to interact with pins
  @override
  Future<String> PinOn(PinInformation pinNumber) async {
    if (pinNumber.pinAndPhysicalPinConfiguration == null) {
      print('Error PinInformation.pinAndPhysicalPinConfiguration was not set');
      return 'Error PinInformation.pinAndPhysicalPinConfiguration was not set';
    }
    if (SharedVariables.GetProjectRootDirectoryPath() == null) {
      print('Error SharedVariables.GetProjectRootDirectoryPath was not set');
      return 'Error SharedVariables.GetProjectRootDirectoryPath was not set';
    }

    try {
      print('This is the pin number on ' +
            pinNumber.pinAndPhysicalPinConfiguration.toString());
      return await Process.run(
          SharedVariables.GetProjectRootDirectoryPath() +
          '/scripts/cScripts/turnOn',
          [pinNumber.pinAndPhysicalPinConfiguration.toString()]).then((
                                                                          ProcessResult results) {
        print(results.stdout);
        return results.stdout;
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return 'Path/argument 1 is not specified';
    }
  }


  @override
  Future<String> PinOff(PinInformation pinNumber) async {
    try {
      print('This is the pin number off:  ' +
            pinNumber.pinAndPhysicalPinConfiguration.toString());
      return await Process.run(
          SharedVariables.GetProjectRootDirectoryPath() +
          '/scripts/cScripts/turnOff',
          [pinNumber.pinAndPhysicalPinConfiguration.toString()]).then((
                                                                          ProcessResult results) {
        print(results.stdout);
        return results.stdout;
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return 'Path/argument 1 is not specified';
    }
  }
}
