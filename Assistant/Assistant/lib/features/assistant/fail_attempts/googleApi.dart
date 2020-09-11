import 'package:googleapis/speech/v1.dart';
import 'package:googleapis/storage/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class SpeechFromGoogleApi {
  var accountCredentials = ServiceAccountCredentials.fromJson({
    'private_key_id': '',
    'private_key': '',
    'client_email': '',
    'client_id': '',
    'type': 'service_account'
  });

  static const _SCOPES = const [SpeechApi.CloudPlatformScope];

  void main() {
    clientViaServiceAccount(accountCredentials, _SCOPES).then((http_client) {
      var storage = StorageApi(http_client);
      storage.buckets.list('dart-on-cloud').then((buckets) {
        print('Received ${buckets.items.length} bucket names:');
        for (var file in buckets.items) {
          print(file.name);
        }
      });
    });
  }

  String speechToTextGoogleApi() {
    clientViaServiceAccount(accountCredentials, _SCOPES).then((http_client) {
      SpeechApi speechApi = SpeechApi(http_client);

      RecognizeRequest recognizeRequest = RecognizeRequest();

      LongRunningRecognizeResponse longRunningRecognizeResponse =
          LongRunningRecognizeResponse();
      print('Hy man: ' + longRunningRecognizeResponse.results.toString());

      RecognitionAudio recognitionAudio = RecognitionAudio();
//      recognitionAudio.contentAsBytes

//      ApiRequester apiRequester = ApiRequester();
//      SpeechResourceApi speechResourceApi = SpeechResourceApi(http_client);
//      speechResourceApi.recognize(request);
    });
  }
}
