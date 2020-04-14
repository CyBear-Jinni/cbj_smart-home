import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_usecase/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/listen_to_pin_high.dart';

abstract class ButtonObjectLocalAbstract {
  ListenToPinHigh listenToButtonClick;

  ButtonObjectLocalAbstract() {
    listenToButtonClick = ListenToPinHigh();
  }

  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation lightPin);

  //  Listen to two buttons but work only if one is pressed.
  void listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondButtonPinNumber,
      PinInformation secondLightPin);

  void listenToButtonPressAndDoAction(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonNumber);

  //  Logic of two buttons
  Future changePinsOutput(SmartDeviceBaseAbstract smartDevice,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonPressNumber);
}
