import '../abstract_smart_devices/smart_device_static_abstract.dart';

class BlindsObject extends SmartDeviceStaticAbstract {
  BlindsObject(macAddress, deviceName, onOffPinNumber,
      upButtonPinNumber, int downButtonPinNumber)
      : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: upButtonPinNumber) {

  }
}
