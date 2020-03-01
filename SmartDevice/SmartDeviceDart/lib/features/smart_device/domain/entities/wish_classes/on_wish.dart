
//  Class to change wish on status to device
import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/injection.dart';

class OnWish {

  static String SetOn(DeviceInformation deviceInformation,
      PinInformation pinNumber) {
    pinNumber.v = 1;

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
  static String SetOnLocal(LocalDevice deviceInformation,
      PinInformation pinNumber) {
    getIt<TurnPinOnOffAbstract>().PinOn(pinNumber);
    return 'Response from this device on sucsessful';
  }

  //  Turn remote device on
  static String SetOnRemote(RemoteDevice remoteDevice,
      PinInformation pinNumber) {
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
