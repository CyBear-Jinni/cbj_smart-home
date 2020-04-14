import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_usecase/abstracts_devices/smart_device_dynamic_abstract.dart';


class DynamicLightObject extends SmartDeviceDynamicAbstract {


  DynamicLightObject(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);
}
