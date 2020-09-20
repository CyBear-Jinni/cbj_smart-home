import 'dart:io';

class PythonSpeechToText {
  String projectPath;

  PythonSpeechToText() {
    projectPath =
        '/home/guyl/Documents/programing/git/Smart-Home/SmartDevice/scripts/pythonScripts/voiceAssistance/';
  }

  Future<ProcessResult> listenToVoiceCommand() async {
    print('Start talking');
    await Future.delayed(const Duration(milliseconds: 3000));

    return await Process.run(
        projectPath + 'venv/bin/python3', [projectPath + 'main.py']);
//        .then((ProcessResult results) { print(results.stdout.toString());});
  }
}
