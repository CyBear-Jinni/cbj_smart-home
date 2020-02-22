import 'package:SmartDeviceDart/core/manage_physical_components/controlloling_pins.dart';
import 'package:SmartDeviceDart/core/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:test/test.dart';

void main() {
  test('PinInformation PinInformation.pinAndPhysicalPinConfiguration is null',
      () async {
    PinInformation pinInformation = PinInformation();

    String pinOnResponse = await PinOn(pinInformation);

    expect(pinOnResponse,
        'Error PinInformation.pinAndPhysicalPinConfiguration was not set');
  });

  test('PinInformation', () async {
    PinInformation pinInformation =
        PinInformation(pinAndPhysicalPinConfiguration: 2);

    String pinOnResponse = await PinOn(pinInformation);

    expect(pinOnResponse,
        'Error SharedVariables.GetProjectRootDirectoryPath was not set');
  });
}
