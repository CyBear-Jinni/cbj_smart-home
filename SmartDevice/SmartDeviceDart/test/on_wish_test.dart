import 'package:SmartDeviceDart/shered/device_information.dart';
import 'package:SmartDeviceDart/smart_device/smart_device_objects/simple_devices/light_object.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    LocalDevice('This is the mac Address', 'This is the name of the device');
    LightObject lightObject =
        LightObject("30:23:a2:G3:34", "Guy ceiling light", 11);
    DeviceInformation("30:23:a2:G3:34", "Guy ceiling light");
//    OnWish.SetOn(deviceInformation, pinNumber);
    expect(2, 42);
  });
}
