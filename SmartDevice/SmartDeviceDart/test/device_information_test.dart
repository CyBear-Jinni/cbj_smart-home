import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:test/test.dart';

void main() {
  test('DeviceInformation', () {
    var deviceUuid = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';

    var deviceInformation = DeviceInformation(deviceUuid, smartInstanceName);

    expect(deviceInformation.getUuid(), deviceUuid);
    expect(deviceInformation.getName(), smartInstanceName);
  });

  test('RemoteDevice', () {
    var deviceUuid = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';
    var deviceIp = '10.0.0.10';

    var deviceInformation =
    RemoteDevice(deviceUuid, smartInstanceName, deviceIp);

    expect(deviceInformation.getUuid(), deviceUuid);
    expect(deviceInformation.getName(), smartInstanceName);
    expect(deviceInformation.getIp(), deviceIp);
  });

  test('LocalDevice', () {
    var deviceUuid = '30:23:a2:G3:34';
    var smartInstanceName = 'Guy ceiling light';

    var deviceInformation = LocalDevice(deviceUuid, smartInstanceName);

    expect(deviceInformation.getUuid(), deviceUuid);
    expect(deviceInformation.getName(), smartInstanceName);
  });
}
