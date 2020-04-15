import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';

class TurnPinOnWiringPiSetupPhys {
  Future<ProcessResult> TurnThePinOn(String physicalPinNumber) async {
    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupPhys',
        [physicalPinNumber]);
  }
}
