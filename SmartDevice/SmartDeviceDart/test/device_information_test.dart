import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:test/test.dart';

void main() {
  test('DeviceInformation', () {
    var deviceMacAddress = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';

    var deviceInformation =
        DeviceInformation(deviceMacAddress, smartInstanceName);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), smartInstanceName);
  });

  test('RemoteDevice', () {
    var deviceMacAddress = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';
    var deviceIp = '10.0.0.10';

    var deviceInformation =
        RemoteDevice(deviceMacAddress, smartInstanceName, deviceIp);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), smartInstanceName);
    expect(deviceInformation.getIp(), deviceIp);
  });

  test('LocalDevice', () {
    var deviceMacAddress = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';

    var deviceInformation = LocalDevice(deviceMacAddress, smartInstanceName);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), smartInstanceName);
  });
}
