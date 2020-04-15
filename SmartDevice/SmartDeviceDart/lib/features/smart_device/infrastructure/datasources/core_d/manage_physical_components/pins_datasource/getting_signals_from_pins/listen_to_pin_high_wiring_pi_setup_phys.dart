import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';

class ListenToPinHighWiringPiSetupPhys {
  //  Listen to button press once and return exist code
  Future<int> listenToButtonPress(String pinNumber) async {
    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/phisicalComponents/gettingSignals/listenToPinHighWiringPiSetupPhys',
        [pinNumber]).then((ProcessResult results) {
      if (results.stdout.toString().length == 96) {
        return -1;
      }
      return 0;
    });
  }
}
