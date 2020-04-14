import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_usecase/actions_to_preform.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_usecase/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/hot_keyword_entitiy/hot_keyword_entity.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';

//  This class will listen for the hot keyword using snowboy
class HotKeywordUsecase {
  HotKeywordEntity _hotKeywordEntity;

  HotKeywordUsecase() {
    _hotKeywordEntity = HotKeywordEntity();
  }

  void startListeningToVoiceCommandForever() async {
    _hotKeywordEntity.startListeningToVoiceCommandForever().listen((event) {
      if (!event) {
        return;
      }
      print('Recived voice command');
      ActionsToPreform.executeWishEnum(
          MySingleton.getSmartDevicesList()[0] as LightObject,
          WishEnum.SChangeState);

      print('Got Voice command');
    });
  }
}
