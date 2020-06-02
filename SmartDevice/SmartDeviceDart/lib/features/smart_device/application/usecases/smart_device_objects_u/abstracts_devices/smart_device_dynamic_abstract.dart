import 'package:SmartDeviceDart/features/smart_device/application/usecases/wish_classes_u/dynamic_wish_u.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums.dart';

import 'smart_device_simple_abstract.dart';

//  Abstract class for smart devices class with dynamic property
abstract class SmartDeviceDynamicAbstract extends SmartDeviceSimpleAbstract {
  double dynamicValue; //  Save how much power to do for action


  SmartDeviceDynamicAbstract(macAddress, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, smartInstanceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);


  @override
  Future<String> executeWishString(String wishString,
      WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    if(wish == null) return 'Your wish does not exist on ';
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return _WishInDynamicClass(wishEnum, wishSourceEnum);
  }
  
  //  Set dynamic value
  String _SetDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant set dynamic value';
    }
    return DynamicWishU.setDynamic(deviceInformation);
  }

  //  Change dynamic value with open connection
  String _OpenDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant create open connection with dynamic ';
    }
    DynamicWishU.openDynamic(deviceInformation);
    onOff = false;
    return 'Turn on sucsessfuly';
  }

  //  All the wishes that are legit to execute from the dynamic class
  String _WishInDynamicClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    switch (wish) {
      case WishEnum.SDynamic:
        return _SetDynamicValue();
      case WishEnum.ODynamic:
        return _OpenDynamicValue();
      default:
        return wishInSimpleClass(wish, wishSourceEnum);
    }
  }
}
