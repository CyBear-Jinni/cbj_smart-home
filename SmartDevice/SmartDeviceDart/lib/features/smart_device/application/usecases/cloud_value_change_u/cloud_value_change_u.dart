import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/cloud_value_change_e/cloud_value_change_e.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:firedart/firedart.dart';

class CloudValueChangeU {
  CloudValueChangeE _cloudValueChangeEntity;

  CloudValueChangeU() {
    _cloudValueChangeEntity = CloudValueChangeE();
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    _cloudValueChangeEntity.listenToDataBase().listen((document) {
      Document myDocument = document;
      print('Change ditected in firestore');

      Map<SmartDeviceBaseAbstract, String> devicesNamesThatValueChanged =
          Map<SmartDeviceBaseAbstract, String>();

      MySingleton.getSmartDevicesList().forEach((element) {
        if (myDocument.map.containsKey(element.smartInstanceName)) {
          if (element.getDeviceState() !=
              myDocument.map[element.smartInstanceName]) {
            devicesNamesThatValueChanged[element] =
                myDocument.map[element.smartInstanceName].toString();
          }
        }
      });

      devicesNamesThatValueChanged.forEach((smartDeviceBaseAbstract, value) {
        print('FireBase "' + smartDeviceBaseAbstract.smartInstanceName +
            '" have defferent value, will now change to ' + value.toString());
        WishEnum wishEnum;
        switch (value) {
          case('true'):
            wishEnum = WishEnum.SOn;
            break;
          case('false'):
            wishEnum = WishEnum.SOff;
            break;
          default:
            wishEnum = EnumHelper.stringToWishEnum(value);
            break;
        }
        ActionsToPreformU.executeWishEnum(
            smartDeviceBaseAbstract, wishEnum, WishSourceEnum.FireBase);
      });
    });
  }
}
