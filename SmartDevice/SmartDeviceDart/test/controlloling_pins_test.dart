import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local.dart';
import 'package:test/test.dart';

void main() {
  test('PinInformation PinInformation.pinAndPhysicalPinConfiguration is null',
      () async {
             var pinInformation = PinInformation();

             var pinOnResponse = await TurnPinOnOffLocal().pinOn(
        pinInformation);

    expect(pinOnResponse,
        'Error PinInformation.pinAndPhysicalPinConfiguration was not set');
  });

  test('PinInformation', () async {
    var pinInformation =
        PinInformation(pinAndPhysicalPinConfiguration: 2);

    var pinOnResponse = await TurnPinOnOffLocal().pinOn(
        pinInformation);

    expect(pinOnResponse,
        'Error SharedVariables.GetProjectRootDirectoryPath was not set');
  });
}
