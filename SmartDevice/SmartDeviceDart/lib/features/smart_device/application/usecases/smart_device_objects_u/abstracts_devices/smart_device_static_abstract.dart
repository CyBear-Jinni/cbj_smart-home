import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';

import 'smart_device_base_abstract.dart';

//  Abstract class for devices with property of how much to move and without how much time the device is doing action without stopping
abstract class SmartDeviceStaticAbstract extends SmartDeviceBaseAbstract {
  SmartDeviceStaticAbstract(uuid, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  //  TODO: set how much to move
  String _HowMuchToMove() {
    return 'How much to move not supported yet';
//    if(deviceInformation == null) {
//      return "Device information is missing, cant trun off";
//    }
//    DynamicWish.OpenDynamic(deviceInformation);
//    onOff = false;
//    return 'Turn on sucsessfuly';
  }

  //  All the wishes that are legit to execute from the static class
  @override
  Future<String> executeWishString(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    print(wishString);
    print(wish.toString());
    if(wish == null) return 'Your wish does not exist on static class';
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInStaticClass(wishEnum, wishSourceEnum);
  }

  String wishInStaticClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    switch (wish) {
      case WishEnum.SMovement:
        return _HowMuchToMove();
      default:
        return wishInBaseClass(wish, wishSourceEnum);
    }
  }
}
