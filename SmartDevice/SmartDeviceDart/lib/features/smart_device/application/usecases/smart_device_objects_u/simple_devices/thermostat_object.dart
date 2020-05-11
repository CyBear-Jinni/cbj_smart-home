import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';


class ThermostatObject extends SmartDeviceSimpleAbstract {


  ThermostatObject(macAddress, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, smartInstanceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);
}
