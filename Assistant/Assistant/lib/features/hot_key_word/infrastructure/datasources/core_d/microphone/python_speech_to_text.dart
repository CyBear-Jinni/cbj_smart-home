import 'dart:io';

class PaythonSpeechToText {
  String projectPeth;

  PaythonSpeechToText() {
    projectPeth =
        '/home/guyl/Documents/programing/git/SmartHome/SmartDevice/scripts/pythonScripts/voiceAssistence/';
  }

  Future<ProcessResult> listenToVoiceCommand() async {
    print('Start talking');
    await Future.delayed(const Duration(milliseconds: 3000));

    return await Process.run(
        projectPeth + 'venv/bin/python3', [projectPeth + 'main.py']);
//        .then((ProcessResult results) { print(results.stdout.toString());});
  }
}
