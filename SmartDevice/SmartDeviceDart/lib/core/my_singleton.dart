import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/core_r/my_singleton_helper.dart';

class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  static List<SmartDeviceBaseAbstract> smartDevicesList;
  static Future<String> _deviceUid;
  static Future<String> _currentUserName;

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = <SmartDeviceBaseAbstract>[];
    getUuid();
    getCurrentUserName();
  }

  static Future<String> getUuid() => _deviceUid ??= MySingletonHelper.getUuid();

  static Future<String> getCurrentUserName() =>
      _currentUserName ??= MySingletonHelper.getCurrentUserName();

  static void setSmartDevicesList(
      List<SmartDeviceBaseAbstract> smartDeviceListVal) {
    smartDevicesList = smartDeviceListVal;
  }

  static void addToSmartDevicesList(SmartDeviceBaseAbstract smartDeviceVal) {
    smartDevicesList.add(smartDeviceVal);
  }

  static List<SmartDeviceBaseAbstract> getSmartDevicesList() =>
      smartDevicesList;
}

class FirebaseAccountInformationFlutter {
  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  FirebaseAccountInformationFlutter(this.fireBaseProjectId, this.fireBaseApiKey,
      this.userEmail, this.userPassword);

  bool areAllValuesNotNull() {
    return fireBaseProjectId != null &&
        fireBaseApiKey != null &&
        userEmail != null &&
        userPassword != null;
  }
}
