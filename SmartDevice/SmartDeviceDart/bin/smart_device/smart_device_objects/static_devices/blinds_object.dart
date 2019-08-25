import '../abstract_smart_devices/smart_device_static_abstract.dart';

class BlindsObject extends SmartDeviceStaticAbstract{
  BlindsObject(String macAddress, String deviceName, int onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber, onOffButtonPinNumber:onOffButtonPinNumber);

}