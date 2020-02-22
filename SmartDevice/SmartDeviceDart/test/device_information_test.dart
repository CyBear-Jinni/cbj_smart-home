import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:test/test.dart';

void main() {
  test('DeviceInformation', () {
    String deviceMacAddress = '30:23:a2:G3:34';
    String deviceName = 'Guy ceiling light';

    DeviceInformation deviceInformation =
        DeviceInformation(deviceMacAddress, deviceName);

    expect(deviceInformation.GetMacAddress(), deviceMacAddress);
    expect(deviceInformation.GetName(), deviceName);
  });

  test('RemoteDevice', () {
    String deviceMacAddress = '30:23:a2:G3:34';
    String deviceName = 'Guy ceiling light';
    String deviceIp = '10.0.0.10';

    RemoteDevice deviceInformation =
        RemoteDevice(deviceMacAddress, deviceName, deviceIp);

    expect(deviceInformation.GetMacAddress(), deviceMacAddress);
    expect(deviceInformation.GetName(), deviceName);
    expect(deviceInformation.GetIp(), deviceIp);
  });

  test('LocalDevice', () {
    String deviceMacAddress = "30:23:a2:G3:34";
    String deviceName = "Guy ceiling light";

    LocalDevice deviceInformation = LocalDevice(deviceMacAddress, deviceName);

    expect(deviceInformation.GetMacAddress(), deviceMacAddress);
    expect(deviceInformation.GetName(), deviceName);
  });
}
