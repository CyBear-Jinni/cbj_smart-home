import 'device_configuration_base_class.dart';
import 'pin_information.dart';

class NanoPiNeoConfiguration extends DeviceConfigurationBaseClass {
  static List<PinInformation> _pinListNanoPiNeo = [
  ];

  NanoPiNeoConfiguration() {
    pinList = _pinListNanoPiNeo;
  }
}
