import 'package:file/file.dart' as fileO;
import 'package:file/memory.dart';
import 'package:googleapis/speech/v1.dart';
import 'package:googleapis/texttospeech/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class SpeechToText {
  var _credentials = ServiceAccountCredentials.fromJson({
    'private_key_id': 'a912961c5a627690ea12866f1937e70a5481242b',
    'private_key':
        '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCzC5qJ4nOaFGpo\nENaNkLVm96wxdrBLEDi6u4v+fWe3XN90/Fag5bCYNLzP61mVgprziGhhyHYXXRtb\nzeWP3s+SX8YXK+2Ir+6b/5AzqZlLPwWrwNrk1ujvuYZ7q7Pe5UpUkCN0hOsXc0I5\nLjihvDFmtSFjnEtskxr3w7PvYA6q7nh21AlVHZ8ZIrhKY/i8vtVqJxgJNPJtkTZy\nZi8s6nKFNDUwA0bwMZcYz2uk7Sug0WYhDbEw/z81dGgqvNYZ5n2KJYzkT+qzWllj\nBChKAw6dhXqvAgt+ykKB7NmCStdA1KoWUnMaMU2rvXfgpJNmU+6RIav4/xSSiLlj\nVXAS1M13AgMBAAECggEAQCp1bNryMRMF+1uleMCWslsqo+N0VMJwgkN6bW8F/4nS\nL3vLlAgdHL8xt5YR2eofnA2T0w9jewYMKv+EOOZSH5QhSuacTzM14URaqpkqbfQd\nFSudhwuaGWe00Zd8c/JajCnH+xczpYjR/+oXs6bdUYCygZ9ezH9/17GUR8J2Hz2U\nCuMQCCWKaAlQHqajykTS2+kqfADnPhoL/Yjjs0N09Mqp4Ud7XWbgEyQGTERiq6mC\nF5hSm/JBszlkU1gTV+vEmgsdpm0R6akOO4QLFvpKODZxufehIJMf0jWeTNCIXyOU\ndwDRojWfu0V6EmaIrQ2w6Gf6JNmj6uj3yfLWDtje6QKBgQDX37mcGj48ndwQfVwa\n3uM4le+ekLwxPrgurdIHTqE/Ub7EUqymJyWre4S6ma+dC1ApSzk/ZOT0bntK8114\nLmVho7D+ifBbFx+4n5Zi9pol/1FvAIF4PcKUEZdFohpYwcwGkOcdC7HrJmHNR/vs\nYrUmtYXJequfC1IdJCSIyWhAcwKBgQDUU2eFUN9sGYJcrlFyA//7vC7Fs2x1BvDm\nSepY+v5v2tZ+smaWyqg3UryydSqrJsX8AMfllM9tIK/lLFZ0UZmgo179L4TYUFiU\n1Txd9A44sTR+QRZ0iV5DjaC0DsP0EwTOcAf1BxVBcQ+HU48wozhCUHcdPpOKZ+kp\nJcFeB/CR7QKBgHw2wYhvGUyr0Mq0N2FGyxvuOljVE1SKsFQ7tFR8DBBxKwGwSKO6\ndtR7WF4+vGvy7Ic2P5SYq51yTQNNkYTrvW43UErGeEURwzDqsw/ysbQXe3YRpm3X\nq7SjgpWQtvRHXuyQSEvQROn3xeLm/rCAA5hobrkGGuaDDxaxi0wiCBi9AoGAU7qg\nNB50PLjCg7HqRD/3jlnjR+s9ddjK3sV/OJ+h/pIZy9SmSAia1VY3O1ig/uVHZd0Y\n9xv7wFkHhCQ745raLlK+frFifbsRc3+zUomPoiOfQ7p/FG2nUpRjLx4zf+iQGKht\nOt8ULr5bFU6KRO/Ym64HiuzGWeooNCXDX0VaRPECgYAT0aQ5R11C9EX51mT7X7KB\n/mr3VkKxkaNbKJ+dDmCrNn3W+VRns0tMNihNlf1VrctJ8LUOqEL4DOY9WNzM49yM\n64owCjfpjsDoTuO0SC0Y+IR4YmFFfaZQvYEFv6bcZ0Ryr0l2GMwDzMCvNpY8Nd/C\n7N/aFdylyAIJdRLIq4C4EA==\n-----END PRIVATE KEY-----\n',
    'client_email': 'dart-assistant@smarthome-3765e.iam.gserviceaccount.com',
    'client_id': '102406342605763305677',
    'type': 'service_account'
  });

  static const myRequest = {
    "config": {
      "encoding": "FLAC",
      "sampleRateHertz": 16000,
      "languageCode": "en-US",
      "enableWordTimeOffsets": false
    },
    "audio": {"uri": "gs://cloud-samples-tests/speech/brooklyn.flac"}
  };

  String start() {
    const _SCOPES = const [
      SpeechApi.CloudPlatformScope,
      TexttospeechApi.CloudPlatformScope
    ];
    clientViaServiceAccount(_credentials, _SCOPES).then((http_client) async {
      final fileO.FileSystem fs = MemoryFileSystem();
      final fileO.Directory tmp =
          await fs.systemTempDirectory.createTemp('exampleSSS');
      final fileO.File outputFile = tmp.childFile('output');
      await outputFile.writeAsString('Hello world!');
      print('Start');
      print(outputFile.readAsStringSync());

      print('Done');
//      'resorce/first.wav';

      SpeechApi speechApi = SpeechApi(http_client);

      RecognizeRequest recognizeRequest = RecognizeRequest();

      RecognitionAudio recognitionAudio = RecognitionAudio();
      recognitionAudio.content = outputFile.toString();

      RecognitionConfig recognitionConfig = RecognitionConfig();

      recognitionConfig.encoding = 'LINEAR16';
      recognitionConfig.sampleRateHertz = 22000;
      recognitionConfig.languageCode = 'en-US';

      recognizeRequest.audio = recognitionAudio;
      recognizeRequest.config = recognitionConfig;

      SpeechResourceApi speechResourceApi = speechApi.speech;

      RecognizeResponse recognizeResponse =
          await speechResourceApi.recognize(recognizeRequest);
      recognizeRequest.audio;
      print('Done');
    });
    return 'Not working';
  }
}
