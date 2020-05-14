import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';


class DynamicLightObject extends SmartDeviceDynamicAbstract {


  DynamicLightObject(macAddress, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, smartInstanceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);
}
