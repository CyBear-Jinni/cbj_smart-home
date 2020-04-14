import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/hot_keyword_repository/hot_keyword_repository.dart';

class HotKeywordEntity {
  HotKeyWordRepository _hotKeyWordRepository;

  HotKeywordEntity() {
    _hotKeyWordRepository = HotKeyWordRepository();
  }

  Stream<bool> startListeningToVoiceCommandForever() async* {
    yield* _hotKeyWordRepository.startListeningToVoiceCommandForever();
  }
}
