import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/wish_classes_r/wish_classes_r.dart';

class WishClassesE {
  WishClassesR _wishClassesR;

  WishClassesE() {
    _wishClassesR = WishClassesR();
  }

  Future<String> pinOff(PinInformation pinNumber) {
    return _wishClassesR.pinOff(pinNumber);
  }
}
