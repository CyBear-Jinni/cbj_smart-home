import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/cloud_value_change_e/cloud_value_change_e.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:firedart/firedart.dart';

class CloudValueChangeU {
  static CloudValueChangeU _cloudValueChangeU;
  CloudValueChangeE _cloudValueChangeEntity;

  CloudValueChangeU(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudValueChangeU = this;
    _cloudValueChangeEntity = CloudValueChangeE(firebaseAccountsInformationD);
  }

  static CloudValueChangeU getCloudValueChangeU() {
    return _cloudValueChangeU;
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    _cloudValueChangeEntity.updateDocument(fieldToUpdate, valueToUpdate);
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    _cloudValueChangeEntity.listenToDataBase().listen((document) {
      Document firestoreDocument = document;
      print('Change detected in firestore');

      Map<SmartDeviceBaseAbstract, String> devicesNamesThatValueChanged =
          Map<SmartDeviceBaseAbstract, String>();

      MySingleton.getSmartDevicesList().forEach((element) {
        if (firestoreDocument.map.containsKey(element.smartInstanceName)) {
          if (element.getDeviceState() !=
              firestoreDocument.map[element.smartInstanceName]) {
            devicesNamesThatValueChanged[element] =
                firestoreDocument.map[element.smartInstanceName].toString();
          }
        }
      });

      devicesNamesThatValueChanged.forEach((smartDeviceBaseAbstract, value) {
        print('FireBase "' + smartDeviceBaseAbstract.smartInstanceName +
            '" have different value, will now change to ' + value.toString());
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
