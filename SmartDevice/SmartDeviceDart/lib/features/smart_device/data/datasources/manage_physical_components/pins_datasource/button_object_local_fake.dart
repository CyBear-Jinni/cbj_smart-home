import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(ButtonObjectLocalAbstract, env: Env.test)
@injectable
class ButtonObjectLocalFake extends ButtonObjectLocalAbstract {
  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation lightPin) {}

  //  Listen to two buttons but work only if one is pressed.
  void listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondButtonPinNumber,
      PinInformation secondLightPin) async {}

  void listenToButtonPressAndDoAction(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonNumber) async {}

  //  Listen to button press and return exist code
  Future<int> listenToButtonPress(PinInformation buttonPinNumber) async {
    return 0;
  }

  //  Logic of two buttons
  Future changePinsOutput(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonPressNumber) async {}
}
