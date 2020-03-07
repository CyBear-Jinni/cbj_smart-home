import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';

class ActionsToPreform {
  static String executeWishEnum(
      SmartDeviceBaseAbstract smartDevice, WishEnum wishEnum) {
    String deviceStatus = smartDevice.WishInBaseClass(wishEnum);
    print('Device state is ' + deviceStatus);

    return deviceStatus;
  }
}
