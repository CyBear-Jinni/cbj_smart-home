import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums.dart';

// This class Preform most of the request
class ActionsToPreformU {
  static Future<String> executeWishEnum(SmartDeviceBaseAbstract smartDevice,
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) async {
    var deviceStatus = await smartDevice.executeWish(wishEnum, wishSourceEnum);
    print('Device state is ' + deviceStatus);

    return deviceStatus;
  }

}
