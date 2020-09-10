import 'package:file/file.dart' as fileO;
import 'package:file/memory.dart';
import 'package:googleapis/speech/v1.dart';
import 'package:googleapis/texttospeech/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class SpeechToText {
  var _credentials = ServiceAccountCredentials.fromJson({
    'private_key_id': '',
    'private_key': '',
    'client_email': '',
    'client_id': '',
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
