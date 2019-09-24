import '../device_information.dart';
import '../manage_physical_components/controlloling_pins.dart';

class OffWish {
  static String SetOff(DeviceInformation deviceInformation, int pinNumber) {
    switch (deviceInformation.runtimeType) {
      case LocalDevice:
        return SetOffLocal(deviceInformation, pinNumber);
      case RemoteDevice:
        return SetOffRemote(deviceInformation, pinNumber);
    }
    return 'DeviceBase type not supported';
  }

  //  Turn this device off
  static String SetOffLocal(LocalDevice deviceInformation, int pinNumber) {
//    pinOff(7);
    pinOff(pinNumber);
    return 'Response from this device off sucsessful';
  }

  //  Change remote device off
  static String SetOffRemote(RemoteDevice remoteDevice, int pinNumber) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=OFF')) // produces a request object
//          .then((request) => request.close()) // sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    } catch (e) {
//      print('Exeption: ' + e);
//    }
    return 'Response from remote device off sucsessful';
  }
}
