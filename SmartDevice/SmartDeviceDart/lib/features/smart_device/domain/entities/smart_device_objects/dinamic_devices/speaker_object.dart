import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_dynamic_abstract.dart';

class SpeakerObject extends SmartDeviceDynamicAbstract {


  SpeakerObject(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);
}
