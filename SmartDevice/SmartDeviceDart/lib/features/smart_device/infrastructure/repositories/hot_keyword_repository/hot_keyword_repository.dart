import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hot_keyword_datasource/hot_keyword_datasource.dart';

class HotKeyWordRepository {
  HotKeywordDatasource _microphoneVoiceCommand;

  HotKeyWordRepository() {
    _microphoneVoiceCommand = HotKeywordDatasource();
  }

  Stream<bool> startListeningToVoiceCommandForever() async* {
    yield* _microphoneVoiceCommand.loopListenToActivateKeyWord();
  }
}
