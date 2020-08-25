import 'dart:io';

import 'package:Assistant/core/shared_variables.dart';

class Microphone {
  Future<ProcessResult> listenToVoiceCommand() async {
    print('Path to demo' +
        SharedVariables.getProjectRootDirectoryPath() +
        '/scripts/cScripts/demo');
    print('argument' + SharedVariables.getProjectRootDirectoryPath());

    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/demo',
        [SharedVariables.getProjectRootDirectoryPath()]);
  }
}
