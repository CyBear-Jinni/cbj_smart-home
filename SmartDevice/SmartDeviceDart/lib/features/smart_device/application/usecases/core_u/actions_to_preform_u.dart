import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';

// This class Preform most of the request
class ActionsToPreformU {
  static String executeWishEnum(SmartDeviceBaseAbstract smartDevice,
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) {
    var deviceStatus = smartDevice.wishInBaseClass(wishEnum, wishSourceEnum);
    print('Device state is ' + deviceStatus);

    return deviceStatus;
  }

}
