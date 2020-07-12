import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/local_db_d/local_db_d.dart';

class LocalDbR {
  LocalDbD _localDbD;

  LocalDbR() {
    _localDbD = LocalDbD();
  }

  Future<List<SmartDeviceBaseAbstract>> getListOfSmartDevices() async {
    List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractList =
        List<SmartDeviceBaseAbstract>();
    String currentDeviceUuid = await MySingleton.getUuid();

    Map<String, List<String>> deviceListMap =
        await _localDbD.getListOfSmartDevices();
    if (deviceListMap == null) {
      return null;
    }
    for (String deviceName in deviceListMap.keys) {
      List<String> values = deviceListMap[deviceName];
      DeviceType deviceType = EnumHelper.stringToDeviceType(values.first);

      int onOffPinNumber = values[1] == null ? null : int.parse(values[1]);
      int onOffButtonPinNumber =
          values[2] == null ? null : int.parse(values[2]);

      switch (deviceType) {
        case (DeviceType.Light):
          print('Adding from local db light object');
          smartDeviceBaseAbstractList.add(LightObject(
              currentDeviceUuid, deviceName, onOffPinNumber,
              onOffButtonPinNumber: onOffButtonPinNumber));
          break;
        case (DeviceType.Blinds):
          print('Adding from local db blind object');
          if (values.length < 7) {
            break;
          }
          int blindsUpPin = values[3] == null ? null : int.parse(values[3]);
          int upButtonPinNumber = values[4] == null ? null : int.parse(
              values[4]);
          int blindsDownPin = values[5] == null ? null : int.parse(values[5]);
          int downButtonPinNumber = values[6] == null ? null : int.parse(
              values[6]);

          smartDeviceBaseAbstractList.add(BlindsObject(
            currentDeviceUuid,
            deviceName,
            onOffPinNumber,
            onOffButtonPinNumber,
            //  onOffButtonPinNumber
            blindsUpPin,
            //  blindsUpPin
            upButtonPinNumber,
            //  upButtonPinNumber
            blindsDownPin,
            //  blindsDownPin
            downButtonPinNumber, // downButtonPinNumber
          )); // NanoPi Duo2
          break;
        default:
          print('Cannot add from local db, device type is not supported');
          break;
      }
    }
    if (smartDeviceBaseAbstractList.isEmpty) {
      smartDeviceBaseAbstractList = null;
    }
    return smartDeviceBaseAbstractList;
  }

  void saveAllDevices(List<SmartDeviceBaseAbstract> smartDevicesList) {
    _localDbD.saveAllDevices(smartDevicesList);
  }
}
