import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';


class LightObject extends SmartDeviceSimpleAbstract {


  LightObject(macAddress, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, smartInstanceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber) {
    print('New light object');
  }

  //  Return smart device type
  @override
  DeviceType getDeviceType() => DeviceType.Light;


  @override
  Future<String> executeWishString(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInSimpleClass(wishEnum, wishSourceEnum);
  }
}
