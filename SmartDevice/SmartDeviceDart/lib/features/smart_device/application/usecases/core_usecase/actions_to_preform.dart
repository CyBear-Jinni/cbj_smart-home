import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_usecase/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';

// This class Preform most of the request
class ActionsToPreform {
  static String executeWishEnum(SmartDeviceBaseAbstract smartDevice, WishEnum wishEnum) {
    var deviceStatus = smartDevice.wishInBaseClass(wishEnum);
    print('Device state is ' + deviceStatus);

    return deviceStatus;
  }

}
