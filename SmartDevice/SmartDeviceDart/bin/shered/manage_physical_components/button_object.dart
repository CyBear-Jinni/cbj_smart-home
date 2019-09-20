import 'dart:io';
import '../../smart_device/smart_device_objects/abstract_smart_devices/smart_device_base_abstract.dart';
import '../enums.dart';
import '../shared_variables.dart';

class ButtonObject {
  SmartDeviceBaseAbstract smartDevice;

  ButtonObject(this.smartDevice);

  void buttonPressed() async {
    int buttonPinNumber = smartDevice.onOffButtonPin;

    while (true) {
      try {
        await Process.run(
            SharedVariables.getSnapPath() + '/scripts/cScripts/buttonPress', [buttonPinNumber.toString()])
            .then((ProcessResult results) {
          print(results.stdout);
          if (smartDevice.onOff) {
            smartDevice.WishInBaseClass(WishEnum.SOff);
          }
          else {
            smartDevice.WishInBaseClass(WishEnum.SOn);
          }
        });
        await Future.delayed(const Duration(seconds: 1));
      }

      catch (error) {
        print('Path/argument 1 is not specified');
        print('error: ' + error.toString());
      }
    }
  }
}