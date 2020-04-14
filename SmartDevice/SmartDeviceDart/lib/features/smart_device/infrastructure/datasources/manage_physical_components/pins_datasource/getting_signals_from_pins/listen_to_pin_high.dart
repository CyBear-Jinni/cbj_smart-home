import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';

class ListenToPinHigh {
  //  Listen to button press and return exist code
  Future<int> listenToButtonPress(PinInformation buttonPinNumber) async {
    return await Process.run(
            SharedVariables.getProjectRootDirectoryPath() +
                '/scripts/cScripts/buttonPress',
            [buttonPinNumber.pinAndPhysicalPinConfiguration.toString()])
        .then((ProcessResult results) {
      if (results.stdout.toString().length == 96) {
        return -1;
      }
      return 0;
    });
  }
}
