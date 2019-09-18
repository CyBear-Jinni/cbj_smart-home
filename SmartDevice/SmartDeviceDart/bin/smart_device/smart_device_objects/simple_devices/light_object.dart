import '../../../shered/enums.dart';
import '../abstract_smart_devices/smart_device_simple_abstract.dart';

class LightObject extends SmartDeviceSimpleAbstract{

  LightObject(String macAddress, String deviceName, int onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber, onOffButtonPinNumber: onOffButtonPinNumber){
    print("New light object");
  }

  //  return smart device type
  @override
  DeviceType getDeviceType() => DeviceType.Light;


  @override
  String ExecuteWish(String wishString) {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return WishInSimpleClass(wish);
  }


}