import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';


class FanObject extends SmartDeviceDynamicAbstract {
  FanObject(uuid, smartInstanceName, onOffPinNumber, {onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);
}
