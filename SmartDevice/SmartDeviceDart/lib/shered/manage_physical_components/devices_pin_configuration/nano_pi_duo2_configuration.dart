import 'device_configuration_base_class.dart';

class NanoPiDuo2Configuration extends DeviceConfigurationBaseClass {
  static const List<int> _gpioListPinDuo = [
    2,
    4,
    8,
    9,
    10,
    11,
    12,
    14,
    16,
    18,
    20,
    22
  ];
  static const List<int> _gpioListWPiNeo = [];

  NanoPiDuo2Configuration() {
    gpioList = _gpioListPinDuo;
  }
}
