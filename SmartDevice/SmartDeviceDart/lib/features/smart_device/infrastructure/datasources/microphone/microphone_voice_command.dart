//  The class activate the compiled C file and return value when the word wast detected or when there is error in executing the file

import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/smart_device_objects/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/VoiceCommand.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

abstract class MicrophoneVoiceCommandAbstract {
  void loopListenToActivateKeyWord();

  Future<bool> listenToVoiceCommand();

}

@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.dev_pi)
@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.prod)
@RegisterAs(MicrophoneVoiceCommandAbstract, env: Env.test)
@injectable
class MicrophoneVoiceCommand extends MicrophoneVoiceCommandAbstract {

  @override
  void loopListenToActivateKeyWord() async {
    bool voiceOutput;
    while (true) {
      if(! await listenToVoiceCommand()) {
        continue;
      }
      print('Recived voice command');
      VoiceCommand().executeWishEnum(
          MySingleton.getSmartDevicesList()[0] as LightObject,
          WishEnum.SChangeState);

      print('Got Voice command');
    }
  }


  //  Listen to voice command
  @override
  Future<bool> listenToVoiceCommand() async {
    try {
      return await Process
          .run(
          SharedVariables.getProjectRootDirectoryPath() +
          '/scripts/cScripts/demo',
          [SharedVariables.getProjectRootDirectoryPath()]).then((
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
  @override
  void loopListenToActivateKeyWord() async {
    bool voiceOutput;
    while (true) {
      if(! await listenToVoiceCommand()) {
        continue;
      }
      print('Recived voice command');
      VoiceCommand().executeWishEnum(
          MySingleton.getSmartDevicesList()[0] as LightObject,
          WishEnum.SChangeState);

      print('Got Voice command');
    }
  }

  //  Listen to voice command
  @override
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
