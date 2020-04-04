import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_simple_abstract.dart';


class LightObject extends SmartDeviceSimpleAbstract {


  LightObject(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber) {
    print('New light object');
  }

  //  Return smart device type
  @override
  DeviceType getDeviceType() => DeviceType.Light;


  @override
  Future<String> executeWish(String wishString) async {
    var wish = convertWishStringToWishesObject(wishString);
    return wishInSimpleClass(wish);
  }
}
