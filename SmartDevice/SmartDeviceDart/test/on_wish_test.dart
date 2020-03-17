import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
//    LocalDevice('This is the mac Address', 'This is the name of the device');
//    LightObject lightObject =
//        LightObject("30:23:a2:G3:34", "Guy ceiling light", 11);
//    DeviceInformation deviceInformation = LocalDevice("30:23:a2:G3:34", "Guy ceiling light");
//    SharedVariables('/home/guyl/Documents/programing/git/SmartHome');
//    print(SharedVariables.GetProjectRootDirectoryPath());
    var pinInformation = PinInformation();

//    String a = OnWish.SetOn(deviceInformation, pinInformation);
//    print('This is a: ' + a);
    getIt<TurnPinOnOffAbstract>().pinOn(pinInformation);
    expect(2, 42);
  });
}
