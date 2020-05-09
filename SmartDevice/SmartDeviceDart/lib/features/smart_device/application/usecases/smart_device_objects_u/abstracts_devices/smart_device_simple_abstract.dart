import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';

import 'smart_device_base_abstract.dart';

//  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  double
  howMuchTimeTheDeviceDoingAction; //  How much time the smart device was active (Doing action) continuously


  SmartDeviceSimpleAbstract(macAddress, deviceName,
      onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName,
      onOffPinNumber, onOffButtonPinNumber: onOffButtonPinNumber);


  @override
  Future<String> executeWish(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    return wishInSimpleClass(wish, wishSourceEnum);
  }

  //  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    if(wish == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(wish, wishSourceEnum);
  }
}
