//  This class will listen for the hot keyword using snowboy
import 'package:Assistant/features/hot_key_word/domain/entities/hot_keyword_e/hot_keyword_e.dart';

class HotKeywordU {
  HotKeywordE _hotKeywordEntity;

  HotKeywordU() {
    _hotKeywordEntity = HotKeywordE();
  }

  void startListeningToVoiceCommandForever() async {
    _hotKeywordEntity.startListeningToVoiceCommandForever().listen((event) {
      if (!event) {
        return;
      }
      print('Received voice command');
//      ActionsToPreformU.executeWishEnum(
//          MySingleton.getSmartDevicesList()[0] as LightObject,
//          WishEnum.SChangeState, WishSourceEnum.VoiceAssistant);

      print('Got Voice command');
    });
  }
}
