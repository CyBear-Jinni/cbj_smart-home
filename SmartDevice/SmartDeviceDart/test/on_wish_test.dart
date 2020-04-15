import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local.dart';
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
    TurnPinOnOffLocal().pinOn(pinInformation);
    expect(2, 42);
  });
}
