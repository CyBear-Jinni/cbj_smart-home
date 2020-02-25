import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/controlloling_pins_local.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
//    LocalDevice('This is the mac Address', 'This is the name of the device');
//    LightObject lightObject =
//        LightObject("30:23:a2:G3:34", "Guy ceiling light", 11);
//    DeviceInformation deviceInformation = LocalDevice("30:23:a2:G3:34", "Guy ceiling light");
//    SharedVariables('/home/guyl/Documents/programing/git/SmartHome');
//    print(SharedVariables.GetProjectRootDirectoryPath());
    PinInformation pinInformation = PinInformation();

//    String a = OnWish.SetOn(deviceInformation, pinInformation);
//    print('This is a: ' + a);
    PinOn(pinInformation);
    expect(2, 42);
  });
}
