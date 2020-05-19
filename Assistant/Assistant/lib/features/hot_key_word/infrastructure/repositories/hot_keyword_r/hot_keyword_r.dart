import 'package:Assistant/features/hot_key_word/infrastructure/datasources/hot_keyword_d/hot_keyword_d.dart';

class HotKeyWordR {
  HotKeywordDatasource _microphoneVoiceCommand;

  HotKeyWordR() {
    _microphoneVoiceCommand = HotKeywordDatasource();
  }

  Stream<bool> startListeningToVoiceCommandForever() async* {
    yield* _microphoneVoiceCommand.loopListenToActivateKeyWord();
  }
}
