////AIzaSyCoKvJ4rTr2yTY71yiW6jnfi7pJUWGTAdo
//
//
//// OAuth client
//// 1078955020501-pq80pbkskne7nvjbfmm8smagsnt2tqfr.apps.googleusercontent.com
//// 6B-OqF5yN9scai8ZMPIEtoTX
//
//
//// Service
//// Service account name: Dart-Assistant
//// Service account ID:  dart-assistant@smarthome-3765e.iam.gserviceaccount.com
////Service account ID
//
//
//// Key
//
////{
////"type": "service_account",
////"project_id": "smarthome-3765e",
////"private_key_id": "a912961c5a627690ea12866f1937e70a5481242b",
////"private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCzC5qJ4nOaFGpo\nENaNkLVm96wxdrBLEDi6u4v+fWe3XN90/Fag5bCYNLzP61mVgprziGhhyHYXXRtb\nzeWP3s+SX8YXK+2Ir+6b/5AzqZlLPwWrwNrk1ujvuYZ7q7Pe5UpUkCN0hOsXc0I5\nLjihvDFmtSFjnEtskxr3w7PvYA6q7nh21AlVHZ8ZIrhKY/i8vtVqJxgJNPJtkTZy\nZi8s6nKFNDUwA0bwMZcYz2uk7Sug0WYhDbEw/z81dGgqvNYZ5n2KJYzkT+qzWllj\nBChKAw6dhXqvAgt+ykKB7NmCStdA1KoWUnMaMU2rvXfgpJNmU+6RIav4/xSSiLlj\nVXAS1M13AgMBAAECggEAQCp1bNryMRMF+1uleMCWslsqo+N0VMJwgkN6bW8F/4nS\nL3vLlAgdHL8xt5YR2eofnA2T0w9jewYMKv+EOOZSH5QhSuacTzM14URaqpkqbfQd\nFSudhwuaGWe00Zd8c/JajCnH+xczpYjR/+oXs6bdUYCygZ9ezH9/17GUR8J2Hz2U\nCuMQCCWKaAlQHqajykTS2+kqfADnPhoL/Yjjs0N09Mqp4Ud7XWbgEyQGTERiq6mC\nF5hSm/JBszlkU1gTV+vEmgsdpm0R6akOO4QLFvpKODZxufehIJMf0jWeTNCIXyOU\ndwDRojWfu0V6EmaIrQ2w6Gf6JNmj6uj3yfLWDtje6QKBgQDX37mcGj48ndwQfVwa\n3uM4le+ekLwxPrgurdIHTqE/Ub7EUqymJyWre4S6ma+dC1ApSzk/ZOT0bntK8114\nLmVho7D+ifBbFx+4n5Zi9pol/1FvAIF4PcKUEZdFohpYwcwGkOcdC7HrJmHNR/vs\nYrUmtYXJequfC1IdJCSIyWhAcwKBgQDUU2eFUN9sGYJcrlFyA//7vC7Fs2x1BvDm\nSepY+v5v2tZ+smaWyqg3UryydSqrJsX8AMfllM9tIK/lLFZ0UZmgo179L4TYUFiU\n1Txd9A44sTR+QRZ0iV5DjaC0DsP0EwTOcAf1BxVBcQ+HU48wozhCUHcdPpOKZ+kp\nJcFeB/CR7QKBgHw2wYhvGUyr0Mq0N2FGyxvuOljVE1SKsFQ7tFR8DBBxKwGwSKO6\ndtR7WF4+vGvy7Ic2P5SYq51yTQNNkYTrvW43UErGeEURwzDqsw/ysbQXe3YRpm3X\nq7SjgpWQtvRHXuyQSEvQROn3xeLm/rCAA5hobrkGGuaDDxaxi0wiCBi9AoGAU7qg\nNB50PLjCg7HqRD/3jlnjR+s9ddjK3sV/OJ+h/pIZy9SmSAia1VY3O1ig/uVHZd0Y\n9xv7wFkHhCQ745raLlK+frFifbsRc3+zUomPoiOfQ7p/FG2nUpRjLx4zf+iQGKht\nOt8ULr5bFU6KRO/Ym64HiuzGWeooNCXDX0VaRPECgYAT0aQ5R11C9EX51mT7X7KB\n/mr3VkKxkaNbKJ+dDmCrNn3W+VRns0tMNihNlf1VrctJ8LUOqEL4DOY9WNzM49yM\n64owCjfpjsDoTuO0SC0Y+IR4YmFFfaZQvYEFv6bcZ0Ryr0l2GMwDzMCvNpY8Nd/C\n7N/aFdylyAIJdRLIq4C4EA==\n-----END PRIVATE KEY-----\n",
////"client_email": "dart-assistant@smarthome-3765e.iam.gserviceaccount.com",
////"client_id": "102406342605763305677",
////"auth_uri": "https://accounts.google.com/o/oauth2/auth",
////"token_uri": "https://oauth2.googleapis.com/token",
////"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
////"client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/dart-assistant%40smarthome-3765e.iam.gserviceaccount.com"
////}
//
//
//
//
//import 'package:Assistant/recognize_response_expend.dart';
//import 'package:Assistant/speech/google/cloud/speech/v1/cloud_speech.pbgrpc.dart';
//import 'package:googleapis_auth/auth_io.dart';
//import 'package:grpc/grpc.dart';
//
//
//
//class MyAssistant {
//
//  Future<void> a() async {
//    try {
//      var accountCredentials = ServiceAccountCredentials.fromJson({
//        'private_key_id': 'a912961c5a627690ea12866f1937e70a5481242b',
//        'private_key': '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCzC5qJ4nOaFGpo\nENaNkLVm96wxdrBLEDi6u4v+fWe3XN90/Fag5bCYNLzP61mVgprziGhhyHYXXRtb\nzeWP3s+SX8YXK+2Ir+6b/5AzqZlLPwWrwNrk1ujvuYZ7q7Pe5UpUkCN0hOsXc0I5\nLjihvDFmtSFjnEtskxr3w7PvYA6q7nh21AlVHZ8ZIrhKY/i8vtVqJxgJNPJtkTZy\nZi8s6nKFNDUwA0bwMZcYz2uk7Sug0WYhDbEw/z81dGgqvNYZ5n2KJYzkT+qzWllj\nBChKAw6dhXqvAgt+ykKB7NmCStdA1KoWUnMaMU2rvXfgpJNmU+6RIav4/xSSiLlj\nVXAS1M13AgMBAAECggEAQCp1bNryMRMF+1uleMCWslsqo+N0VMJwgkN6bW8F/4nS\nL3vLlAgdHL8xt5YR2eofnA2T0w9jewYMKv+EOOZSH5QhSuacTzM14URaqpkqbfQd\nFSudhwuaGWe00Zd8c/JajCnH+xczpYjR/+oXs6bdUYCygZ9ezH9/17GUR8J2Hz2U\nCuMQCCWKaAlQHqajykTS2+kqfADnPhoL/Yjjs0N09Mqp4Ud7XWbgEyQGTERiq6mC\nF5hSm/JBszlkU1gTV+vEmgsdpm0R6akOO4QLFvpKODZxufehIJMf0jWeTNCIXyOU\ndwDRojWfu0V6EmaIrQ2w6Gf6JNmj6uj3yfLWDtje6QKBgQDX37mcGj48ndwQfVwa\n3uM4le+ekLwxPrgurdIHTqE/Ub7EUqymJyWre4S6ma+dC1ApSzk/ZOT0bntK8114\nLmVho7D+ifBbFx+4n5Zi9pol/1FvAIF4PcKUEZdFohpYwcwGkOcdC7HrJmHNR/vs\nYrUmtYXJequfC1IdJCSIyWhAcwKBgQDUU2eFUN9sGYJcrlFyA//7vC7Fs2x1BvDm\nSepY+v5v2tZ+smaWyqg3UryydSqrJsX8AMfllM9tIK/lLFZ0UZmgo179L4TYUFiU\n1Txd9A44sTR+QRZ0iV5DjaC0DsP0EwTOcAf1BxVBcQ+HU48wozhCUHcdPpOKZ+kp\nJcFeB/CR7QKBgHw2wYhvGUyr0Mq0N2FGyxvuOljVE1SKsFQ7tFR8DBBxKwGwSKO6\ndtR7WF4+vGvy7Ic2P5SYq51yTQNNkYTrvW43UErGeEURwzDqsw/ysbQXe3YRpm3X\nq7SjgpWQtvRHXuyQSEvQROn3xeLm/rCAA5hobrkGGuaDDxaxi0wiCBi9AoGAU7qg\nNB50PLjCg7HqRD/3jlnjR+s9ddjK3sV/OJ+h/pIZy9SmSAia1VY3O1ig/uVHZd0Y\n9xv7wFkHhCQ745raLlK+frFifbsRc3+zUomPoiOfQ7p/FG2nUpRjLx4zf+iQGKht\nOt8ULr5bFU6KRO/Ym64HiuzGWeooNCXDX0VaRPECgYAT0aQ5R11C9EX51mT7X7KB\n/mr3VkKxkaNbKJ+dDmCrNn3W+VRns0tMNihNlf1VrctJ8LUOqEL4DOY9WNzM49yM\n64owCjfpjsDoTuO0SC0Y+IR4YmFFfaZQvYEFv6bcZ0Ryr0l2GMwDzMCvNpY8Nd/C\n7N/aFdylyAIJdRLIq4C4EA==\n-----END PRIVATE KEY-----\n',
//        'client_email': 'dart-assistant@smarthome-3765e.iam.gserviceaccount.com',
//        'client_id': '102406342605763305677',
//        'type': 'service_account'
//      });
//
//      List<String> scopes = ['https://www.googleapis.com/auth/cloud-platform'];
//
//
//      const fileName = './resources/audio.raw';
////    const file = readFile(fileName);
//
//      RecognizeRequest recognizeRequest = RecognizeRequest();
//
//      RecognitionAudio recognitionAudio = RecognitionAudio();
//
//      List<int> audioBytes;
//      recognitionAudio.content = audioBytes;
//
//      RecognitionConfig recognitionConfig = RecognitionConfig();
//      RecognitionConfig_AudioEncoding recognitionConfig_AudioEncoding = RecognitionConfig_AudioEncoding
//          .LINEAR16;
//      recognitionConfig.encoding = recognitionConfig_AudioEncoding;
//      recognitionConfig.sampleRateHertz = 16000;
//      recognitionConfig.languageCode = 'en-US';
//
//
//      recognizeRequest.audio = recognitionAudio;
//      recognizeRequest.config = recognitionConfig;
//
//
////      Future<RecognizeResponse> recognizeResponseFuture = speechClient
////          .recognize(recognizeRequest);
////      RecognizeResponse recognizeResponse = await recognizeResponseFuture;
//
////      String transcription = recognizeResponse.results.map((result) =>
////      result.alternatives[0].transcript).join('\n');
//
////      print('Transcription: ' + transcription);
//
////  speechClient.longRunningRecognize('sda');
////  speechClient.streamingRecognize('sda');
////  speechClient.$createCall('sda');
//
////
////      RecognizeResponseExpend recognizeResponseExpend = RecognizeResponseExpend(
////          clientChannel);
//
//
////      recognizeResponseExpend.recognize(recognizeRequest).then((f) =>
////      {
////        print('WOW f: ' + f.toString())
////      });
////
////  var client = Client();
////  obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client)
////      .then((AccessCredentials credentials) {
////
////
////
////    client.close();
////  });
//
//    }
//    catch (exception) {
//      print('This is the exception: ' + exception);
//    }
//  }
//
//  ClientChannel createClientChannel() {
//    return ClientChannel('https://www.googleapis.com/auth/cloud-platform',
//        port: 50051,
//        options:
//        const ChannelOptions(credentials: ChannelCredentials.insecure()));
//  }
//}
