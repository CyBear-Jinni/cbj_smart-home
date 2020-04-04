import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/controlloling_pins_local.dart';

//  Class to change wish on status to device
class OnWish {

  static String setOn(DeviceInformation deviceInformation,
                      PinInformation pinNumber) {
    pinNumber.v = 1;

    switch (deviceInformation.runtimeType) {
      case LocalDevice:
        return setOnLocal(deviceInformation, pinNumber);
      case RemoteDevice:
        return setOnRemote(deviceInformation, pinNumber);
    }
    print('Device type ' + deviceInformation.getName() + ' is not specefied ');
    return 'DeviceBase type not supported';
  }

  //  Turn this device on
  static String setOnLocal(LocalDevice deviceInformation,
                           PinInformation pinNumber) {
	  TurnPinOnOff().pinOn(pinNumber);
    return 'Response from this device on sucsessful';
  }

  //  Turn the remote device on
  static String setOnRemote(RemoteDevice remoteDevice,
                            PinInformation pinNumber) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=ON')) // Produces a request object
//          .then((request) => request.close()) // Sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    } catch (e) {
//      print('Exeption: ' + e);
//    }
    return 'Response from remote device on sucsessful';
  }
}
