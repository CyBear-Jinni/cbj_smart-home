import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/hot_keyword_e/hot_keyword_e.dart';

//  This class will listen for the hot keyword using snowboy
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
      print('Recived voice command');
      ActionsToPreformU.executeWishEnum(
          MySingleton.getSmartDevicesList()[0] as LightObject,
          WishEnum.SChangeState, WishSourceEnum.VoiceAssistant);

      print('Got Voice command');
    });
  }
}
