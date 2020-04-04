import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';

abstract class TurnPinOnOffAbstract {
  Future<String> pinOn(PinInformation pinNumber);

  Future<String> pinOff(PinInformation pinNumber);
}
