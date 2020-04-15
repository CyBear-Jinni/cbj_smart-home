import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/microphone/microphone_c_script.dart';


//  The class activate the compiled C file and return value when the word wast detected or when there is error in executing the file
abstract class HotKeywordDAbstract {
	Stream<bool> loopListenToActivateKeyWord();
  Future<bool> listenToVoiceCommand();

}


class HotKeywordDatasource extends HotKeywordDAbstract {
  Microphone _microphone;

  HotKeywordDatasource() {
    _microphone = Microphone();
  }

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
      return await _microphone.listenToVoiceCommand().then((
          ProcessResult results) {
        print(results.stdout.toString());
        if (results.stdout
            .toString()
            .length == 96) {
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


class MicrophoneVoiceCommandPc extends HotKeywordDAbstract {
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
