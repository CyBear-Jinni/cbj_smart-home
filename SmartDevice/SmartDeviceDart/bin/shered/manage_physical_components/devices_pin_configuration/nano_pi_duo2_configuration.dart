import 'device_configuration_base_class.dart';

class NanoPiDuo2Configuration extends DeviceConfigurationBaseClass{

  static const List<int> _gpioListDuo = [2, 4, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22];

  NanoPiDuo2Configuration(){
    gpioList = _gpioListDuo;
  }
}