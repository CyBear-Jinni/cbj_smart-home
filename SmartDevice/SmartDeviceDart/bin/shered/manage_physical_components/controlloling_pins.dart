import 'dart:io';

import '../shared_variables.dart';

//  Function to start c script to interact with pins

void PinOn(int pinNumber) async {
  try {
    await Process.run(SharedVariables.getSnapPath() + '/scripts/cScripts/turnOn', [pinNumber.toString()])
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }
  catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
}

void pinOff(int pinNumber) async {
  try {
    await Process.run(SharedVariables.getSnapPath() + '/scripts/cScripts/turnOff', [pinNumber.toString()])
        .then((ProcessResult results) {
      print(results.stdout);
    });
  }
  catch(error){
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }
}
