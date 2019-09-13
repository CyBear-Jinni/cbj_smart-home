

import 'device_configuration_base_class.dart';

class NanoPiNeo2Configuration extends DeviceConfigurationBaseClass{
  static const List<int> _gpioListPythonNeo2 = [3, 5, 7, 8, 10, 11, 12, 13, 15, 16, 18, 19, 21, 22, 23, 24];
  static const List<int> _gpioListWPiNeo = [];

  NanoPiNeo2Configuration() {
    gpioList = _gpioListPythonNeo2;
  }

}