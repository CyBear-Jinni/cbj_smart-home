import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';


//  This class take the request to turn up or down the blinds and act in safe manner with the pins, act so that blinds up and down will not work simultaneously and stop other tasks on them
class BlindsWishU {

  static Future<String> BlindsUp(BlindsObject blindsInformation) async {
    String status;
    print('Turning blind up');

    blindsInformation.blindsDownPin.onDuration = 0;
    status = await OffWishU.setOff(
        blindsInformation.deviceInformation, blindsInformation.blindsDownPin);

    await Future.delayed(
        const Duration(seconds: 1));

    blindsInformation.blindsUpPin.onDuration = -1;
    status += ' ' +
        OnWishU.setOn(
            blindsInformation.deviceInformation, blindsInformation.blindsUpPin);

    return status;
  }

  static Future<String> blindsDown(BlindsObject blindsInformation) async {
    String status;

    blindsInformation.blindsUpPin.onDuration = 0;
    status = await OffWishU.setOff(
        blindsInformation.deviceInformation, blindsInformation.blindsUpPin);

    await Future.delayed(
        const Duration(seconds: 1));

    blindsInformation.blindsDownPin.onDuration = -1;
    status += ' ' +
        OnWishU.setOn(blindsInformation.deviceInformation,
            blindsInformation.blindsDownPin);

    return status;
  }

  static String blindsStop(BlindsObject blindsInformation) {
    String status;


    blindsInformation.blindsUpPin.onDuration = 0;
    status = OffWishU.setOff(
        blindsInformation.deviceInformation, blindsInformation.blindsUpPin);

    blindsInformation.blindsDownPin.onDuration = 0;
    status += ' ' +
        OffWishU.setOff(blindsInformation.deviceInformation,
            blindsInformation.blindsDownPin);

    return status;
  }
}
