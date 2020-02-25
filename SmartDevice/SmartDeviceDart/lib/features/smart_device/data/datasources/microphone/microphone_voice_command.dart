//  The class activate the compiled C file and return value when the word wast detected or when there is error in executing the file

import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

abstract class MicrophoneVoiceCommandAbstract {
  Future<bool> listenToVoiceCommand();
}

@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.dev_pi)
@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.prod)
@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.test)
@injectable
class MicrophoneVoiceCommand extends MicrophoneVoiceCommandAbstract {
  //  Listen to voice command
  Future<bool> listenToVoiceCommand() async {
    try {
      return await Process
          .run(
              SharedVariables.GetProjectRootDirectoryPath() +
                  '/scripts/cScripts/demo',
              [SharedVariables.GetProjectRootDirectoryPath()]).then((
//          SharedVariables.getSnapPath() + '/scripts/cScripts/demo', [SharedVariables.getSnapPath() + "/scripts/cScripts"]).then((
          ProcessResult results) {
        print(results.stdout.toString());
        if (results.stdout.toString().length == 96) {
          return false;
        }
        return true;
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return false;
    }
  }
}

@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.dev_pc)
@injectable
class MicrophoneVoiceCommandPc extends MicrophoneVoiceCommandAbstract {
  //  Listen to voice command
  Future<bool> listenToVoiceCommand() async {
    try {
      return await Future.delayed(const Duration(seconds: 10000000));
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return false;
    }
  }
}
