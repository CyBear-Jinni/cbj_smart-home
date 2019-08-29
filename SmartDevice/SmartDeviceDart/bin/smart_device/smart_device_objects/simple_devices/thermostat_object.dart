import '../abstract_smart_devices/smart_device_simple_abstract.dart';

class ThermostatObject extends SmartDeviceSimpleAbstract{
  ThermostatObject(String macAddress, String deviceName, int onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber, onOffButtonPinNumber: onOffButtonPinNumber);

}