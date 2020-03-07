import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';

abstract class TurnPinOnOffAbstract {
  Future<String> PinOn(PinInformation pinNumber);

  Future<String> PinOff(PinInformation pinNumber);
}
