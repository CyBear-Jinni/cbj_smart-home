import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';

import 'smart_device_base_abstract.dart';

//  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  double
      howMuchTimeTheDeviceDoingAction; //  How much time the smart device was active (Doing action) continuously

  SmartDeviceSimpleAbstract(uuid, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  @override
  Future<String> executeWishString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInSimpleClass(wishEnum, wishSourceEnum);
  }

  //  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    if(wish == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(wish, wishSourceEnum);
  }
}
