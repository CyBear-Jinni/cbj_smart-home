import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_simple_abstract.dart';

class ThermostatObject extends SmartDeviceSimpleAbstract {


  ThermostatObject(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);
}
