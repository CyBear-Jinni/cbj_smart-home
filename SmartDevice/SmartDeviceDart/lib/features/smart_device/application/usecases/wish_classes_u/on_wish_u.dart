import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local.dart';

//  Class to change wish on status to device
class OnWishU {

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
    TurnPinOnOffLocal().pinOn(pinNumber);
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
