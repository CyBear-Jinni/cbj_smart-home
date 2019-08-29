import '../manage_physical_components/controlloling_pins.dart';
import '../device_information.dart';

//  Class to change wish on status to device
class OnWish {
  static String SetOn(DeviceInformation deviceInformation, int pinNumber) {
    switch (deviceInformation.runtimeType) {
      case LocalDevice:
        return SetOnLocal(deviceInformation, pinNumber);
      case RemoteDevice:
        return SetOnRemote(deviceInformation, pinNumber);
    }
    print('Device type ' + deviceInformation.GetName() + ' is not specefied ');
    return 'DeviceBase type not supported';
  }

  //  Turn this device on
  static String SetOnLocal(LocalDevice deviceInformation, int pinNumber) {
    PinOn(pinNumber);
    return 'Response from this device on sucsessful';
  }

  //  Turn remote device on
  static String SetOnRemote(RemoteDevice remoteDevice, int pinNumber) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=ON')) //  Produces a request object
//          .then((request) => request.close()) //  Sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    } catch (e) {
//      print('Exeption: ' + e);
//    }
    return 'Response from remote device on sucsessful';
  }
}
