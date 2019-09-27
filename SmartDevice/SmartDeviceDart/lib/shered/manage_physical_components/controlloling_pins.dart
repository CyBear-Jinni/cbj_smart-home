import 'dart:io';

import '../shared_variables.dart';
import 'devices_pin_configuration/pin_information.dart';

//  Function to start c script to interact with pins

void PinOn(PinInformation pinNumber) async {
  try {
    await Process.run(
        SharedVariables.getSnapPath() + '/scripts/cScripts/turnOn',
        [pinNumber.wPi.toString()]).then((ProcessResult results) {
      print(results.stdout);
    });
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
}

void pinOff(PinInformation pinNumber) async {
  try {
    await Process.run(
        SharedVariables.getSnapPath() + '/scripts/cScripts/turnOff',
        [pinNumber.wPi.toString()]).then((ProcessResult results) {
      print(results.stdout);
    });
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
}
