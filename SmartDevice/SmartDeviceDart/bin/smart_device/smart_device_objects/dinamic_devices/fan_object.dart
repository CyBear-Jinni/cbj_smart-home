import '../abstract_smart_devices/smart_device_dynamic_abstract.dart';

class FanObject extends SmartDeviceDynamicAbstract{
  FanObject(String macAddress, String deviceName, int onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber, onOffButtonPinNumber: onOffButtonPinNumber);

}