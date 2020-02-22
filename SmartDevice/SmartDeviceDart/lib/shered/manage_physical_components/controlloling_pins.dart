import 'dart:io';

import '../shared_variables.dart';
import 'devices_pin_configuration/pin_information.dart';

//  Function to start c script to interact with pins
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


void pinOff(PinInformation pinNumber) async {
  try {
    print("This is the pin number off:  " +
        pinNumber.pinAndPhysicalPinConfiguration.toString());
    await Process.run(
        SharedVariables.GetProjectRootDirectoryPath() +
            '/scripts/cScripts/turnOff',
        [pinNumber.pinAndPhysicalPinConfiguration.toString()]).then((
        ProcessResult results) {
      print(results.stdout);
    });
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
}
