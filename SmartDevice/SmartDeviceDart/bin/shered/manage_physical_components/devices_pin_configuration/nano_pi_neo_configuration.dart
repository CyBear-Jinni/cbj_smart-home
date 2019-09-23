import 'device_configuration_base_class.dart';

class NanoPiNeoConfiguration extends DeviceConfigurationBaseClass {
  static const List<int> _gpioListPythonNeo = [
    7,
    8,
    10,
    11,
    12,
    13,
    15,
    16,
    18,
    20,
    21,
    22,
    23,
    24
  ];
  static const List<int> _gpioListWPiNeo = [];

  NanoPiNeoConfiguration() {
    gpioList = _gpioListPythonNeo;
  }
}
