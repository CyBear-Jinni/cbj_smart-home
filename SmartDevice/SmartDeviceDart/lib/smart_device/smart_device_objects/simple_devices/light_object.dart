import '../../../shered/enums.dart';
import '../abstract_smart_devices/smart_device_simple_abstract.dart';

class LightObject extends SmartDeviceSimpleAbstract {


  LightObject(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber) {
    print("New light object");
  }

  //  Return smart device type
  @override
  DeviceType getDeviceType() => DeviceType.Light;


  @override
  Future<String> ExecuteWish(String wishString) async {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return WishInSimpleClass(wish);
  }
}
