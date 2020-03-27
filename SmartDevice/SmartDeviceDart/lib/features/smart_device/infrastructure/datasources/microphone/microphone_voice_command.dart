//  The class activate the compiled C file and return value when the word wast detected or when there is error in executing the file

import 'dart:io';

import 'package:SmartDeviceDart/core/shared_variables.dart';

abstract class MicrophoneVoiceCommandAbstract {
	Stream<bool> loopListenToActivateKeyWord();

  Future<bool> listenToVoiceCommand();

}


class MicrophoneVoiceCommand extends MicrophoneVoiceCommandAbstract {

  @override
  Stream<bool> loopListenToActivateKeyWord() async* {
    while (true) {
	    yield await listenToVoiceCommand();
    }
  }


  //  Listen to voice command return false if was error, and true when the name was detected
  @override
  Future<bool> listenToVoiceCommand() async {
    try {
	    var didItWork = await Process.run(
			    SharedVariables.getProjectRootDirectoryPath() +
			    '/scripts/cScripts/demo',
			    [SharedVariables.getProjectRootDirectoryPath()]).then((
					                                                          ProcessResult results) {
		    print(results.stdout.toString());
		    if(results.stdout
				       .toString()
				       .length == 96) {
			    return false;
		    }
		    return true;
	    });
	    return didItWork;
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return false;
    }
  }
}


class MicrophoneVoiceCommandPc extends MicrophoneVoiceCommandAbstract {
  @override
  Stream<bool> loopListenToActivateKeyWord() async* {
    while (true) {
	    yield await listenToVoiceCommand();
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
