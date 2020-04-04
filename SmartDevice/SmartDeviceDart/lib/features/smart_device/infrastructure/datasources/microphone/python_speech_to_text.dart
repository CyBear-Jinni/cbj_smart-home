import 'dart:io';

@override
Future<bool> listenToVoiceCommand() async {
  try {
    print('Start talking');
    await Future.delayed(const Duration(milliseconds: 3000)); //
    var projectPeth =
        '/home/guyl/Documents/programing/git/SmartHome/SmartDevice/scripts/pythonScripts/voiceAssistence/';
    var didItWork = await Process.run(
            projectPeth + 'venv/bin/python3', [projectPeth + 'main.py'])
        .then((ProcessResult results) {
      print(results.stdout.toString());
    });
    return didItWork;
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
    return false;
  }
}
