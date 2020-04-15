import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';

class TurnPinOffWiringPiSetupPhys {
  Future<ProcessResult> TurnThePinOff(String physicalPinNumber) async {
    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupPhys',
        [physicalPinNumber]);
  }
}
