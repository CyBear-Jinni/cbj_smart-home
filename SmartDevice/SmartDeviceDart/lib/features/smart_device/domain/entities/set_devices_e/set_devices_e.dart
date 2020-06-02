import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/set_devices_r/set_devices_r.dart';

class SetDevicesE {
  SetDevicesR _setDevicesR;

  SetDevicesE() {
    _setDevicesR = SetDevicesR();
  }

  Future<String> getCurrentDeviceUUid() {
    return _setDevicesR.getCurrentDeviceUUid();
  }

  Future<String> getDeviceDefaultConfig() {
    return _setDevicesR.getDeviceDefaultConfig();
  }

  Future<List<SmartDeviceBaseAbstract>> convertToListOfDevices(
      String textOfSmartDevices) async {
    List<String> devicesSeparated = textOfSmartDevices
        .replaceAll(' ', '')
        .replaceFirst('\n', '')
        .split(',');
    print(devicesSeparated);

    List<DeviceType> deviceTypeList = List<DeviceType>();

    for (String deviceAsString in devicesSeparated) {
      deviceTypeList.add(EnumHelper.stringToDeviceType(deviceAsString));
    }

    if (deviceTypeList.isEmpty) {
      return null;
    }

    List<SmartDeviceBaseAbstract> smartDeviceList =
        List<SmartDeviceBaseAbstract>();
    String uuid = await getCurrentDeviceUUid();

//    Todo: make this part work automatically
    for (DeviceType deviceType in deviceTypeList) {
      int index = deviceTypeList.indexOf(deviceType);
      if (deviceType == DeviceType.Light) {
        if (index == 0) {
          smartDeviceList
              .add(LightObject(uuid, 'Light', 8, onOffButtonPinNumber: 10));
        } else if (index == 1 && !(smartDeviceList[0] is BlindsObject)) {
          smartDeviceList
              .add(LightObject(uuid, 'Light2', 12, onOffButtonPinNumber: 14));
        }
      } else if (deviceType == DeviceType.Blinds) {
        if (index == 0) {
          smartDeviceList.add(BlindsObject(
              uuid,
              'Blinds',
              null,
              //  onOffPinNumber
              null,
              //  onOffButtonPinNumber
              8,
              //  blindsUpPin
              10,
              //  upButtonPinNumber
              12,
              //  blindsDownPin
              14 // downButtonPinNumber
              ));
        }
      }
    }
    if (smartDeviceList.isEmpty) {
      return null;
    }
    return smartDeviceList;
  }
}
