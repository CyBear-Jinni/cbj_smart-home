import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:test/test.dart';

void main() {
  test('PinInformation PinInformation.pinAndPhysicalPinConfiguration is null',
      () async {
             var pinInformation = PinInformation();

             var pinOnResponse = await getIt<TurnPinOnOffAbstract>().pinOn(
        pinInformation);

    expect(pinOnResponse,
        'Error PinInformation.pinAndPhysicalPinConfiguration was not set');
  });

  test('PinInformation', () async {
    var pinInformation =
        PinInformation(pinAndPhysicalPinConfiguration: 2);

    var pinOnResponse = await getIt<TurnPinOnOffAbstract>().pinOn(
        pinInformation);

    expect(pinOnResponse,
        'Error SharedVariables.GetProjectRootDirectoryPath was not set');
  });
}
