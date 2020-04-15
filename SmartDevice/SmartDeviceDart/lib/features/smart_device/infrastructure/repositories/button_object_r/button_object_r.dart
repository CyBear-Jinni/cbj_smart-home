import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/button_object_d/button_object_d.dart';

class ButtonObjectR {
  ButtonObjectD _buttonObjectDatasource;

  ButtonObjectR() {
    _buttonObjectDatasource = ButtonObjectD();
  }

  Future<int> listenToButtonPress(PinInformation buttonPinNumber) {
    return _buttonObjectDatasource.listenToButtonPress(buttonPinNumber);
  }
}
