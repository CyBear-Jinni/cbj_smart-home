import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_d.dart';

class LocalDbD {
  HiveD _hiveD;

  LocalDbD() {
    _hiveD = HiveD();
  }

  Future<Map<String, List<String>>> getListOfSmartDevices() {
    return _hiveD.getListOfSmartDevices();
  }

  Future<Map<String, String>> getListOfDatabaseInformation() {
    return _hiveD.getListOfDatabaseInformation();
  }

  void saveAllDevices(List<SmartDeviceBaseAbstract> smartDevicesList) {
    Map<String, List<String>> smartDevicesMapList = Map<String, List<String>>();

    for (SmartDeviceBaseAbstract smartDeviceBaseAbstract in smartDevicesList) {
      String deviceName = smartDeviceBaseAbstract.smartInstanceName;
      String deviceTypeAsString = EnumHelper.deviceTypeToString(
          smartDeviceBaseAbstract.getDeviceType());
      String onOffPin;
      String onOffButtonPinNumber;
      if (smartDeviceBaseAbstract.onOffPin != null &&
          smartDeviceBaseAbstract.onOffPin.pinAndPhysicalPinConfiguration !=
              null) {
        onOffPin = smartDeviceBaseAbstract
            .onOffPin.pinAndPhysicalPinConfiguration
            .toString();
      }
      if (smartDeviceBaseAbstract.onOffButtonPin != null &&
          smartDeviceBaseAbstract
                  .onOffButtonPin.pinAndPhysicalPinConfiguration !=
              null) {
        onOffButtonPinNumber = smartDeviceBaseAbstract
            .onOffButtonPin.pinAndPhysicalPinConfiguration
            .toString();
      }
      if (smartDeviceBaseAbstract.getDeviceType() == DeviceType.Blinds) {
        BlindsObject blindsObjectTemp = smartDeviceBaseAbstract as BlindsObject;

        String blindsUpPin = null,
            buttonPinUp = null,
            blindsDownPin = null,
            buttonPinDown = null;

        if (blindsObjectTemp.blindsUpPin != null) {
          blindsUpPin = blindsObjectTemp
              .blindsUpPin.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsUpPin != null) {
          buttonPinUp = blindsObjectTemp
              .buttonPinUp.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsDownPin != null) {
          blindsDownPin =
              blindsObjectTemp.blindsDownPin.pinAndPhysicalPinConfiguration
                  .toString();
        }

        if (blindsObjectTemp.buttonPinDown != null) {
          buttonPinDown =
              blindsObjectTemp.buttonPinDown.pinAndPhysicalPinConfiguration
                  .toString();
        }

        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          onOffPin,
          onOffButtonPinNumber,
          blindsUpPin,
          buttonPinUp,
          blindsDownPin,
          buttonPinDown
        ];
      } else {
        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          onOffPin,
          onOffButtonPinNumber
        ];
      }
    }

    _hiveD.saveAllDevices(smartDevicesMapList);
  }


  void saveListOfDatabaseInformation(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    Map<String, String> firebaseAccountsInformationMap = Map<String, String>();

    firebaseAccountsInformationMap[AccountsInformationD.fireBaseProjectId] =
        firebaseAccountsInformationD.fireBaseProjectId;
    firebaseAccountsInformationMap[AccountsInformationD.fireBaseApiKey] =
        firebaseAccountsInformationD.fireBaseApiKey;
    firebaseAccountsInformationMap[AccountsInformationD.userEmail] =
        firebaseAccountsInformationD.userEmail;
    firebaseAccountsInformationMap[AccountsInformationD.userPassword] =
        firebaseAccountsInformationD.userPassword;

    _hiveD.saveListOfDatabaseInformation(firebaseAccountsInformationMap);
  }

}
