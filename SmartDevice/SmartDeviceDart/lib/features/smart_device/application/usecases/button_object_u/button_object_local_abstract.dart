import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';

abstract class ButtonObjectLocalAbstract {
  ButtonObjectR buttonObjectRepository;

  ButtonObjectLocalAbstract() {
    buttonObjectRepository = ButtonObjectR();
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
