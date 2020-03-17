import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(ButtonObjectLocalAbstract, env: Env.test)
@injectable
class ButtonObjectLocalFake extends ButtonObjectLocalAbstract {
  @override
  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
                     PinInformation buttonPinNumber, PinInformation lightPin) {}

  //  Listen to two buttons but work only if one is pressed.
  @override
  void listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondButtonPinNumber,
      PinInformation secondLightPin) async {}

  @override
  void listenToButtonPressAndDoAction(SmartDeviceBaseAbstract smartDevice,
                                      PinInformation buttonPinNumber,
                                      PinInformation firstLightPin,
                                      PinInformation secondLightPin,
                                      int buttonNumber) async {}

  //  Listen to button press and return exist code
  @override
  Future<int> listenToButtonPress(PinInformation buttonPinNumber) async {
    return 0;
  }

  //  Logic of two buttons
  @override
  Future changePinsOutput(SmartDeviceBaseAbstract smartDevice,
                          PinInformation firstLightPin,
                          PinInformation secondLightPin,
                          int buttonPressNumber) async {}
}
