import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/wish_classes/dynamic_wish.dart';

import 'smart_device_simple_abstract.dart';

//  Abstract class for smart devices class with dynamic property
abstract class SmartDeviceDynamicAbstract extends SmartDeviceSimpleAbstract {
  double dynamicValue; //  Save how much power to do for action


  SmartDeviceDynamicAbstract(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);


  @override
  Future<String> ExecuteWish(String wishString) async {
    var wish = ConvertWishStringToWishesObject(wishString);
    if(wish == null) return 'Your wish does not exist on ';
    return _wishInDynamicClass(wish);
  }

  //  Set dynamic value
  String _SetDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant set dynamic value';
    }
    return DynamicWish.SetDynamic(deviceInformation);
  }

  //  Change dynamic value with open connection
  String _OpenDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant create open connection with dynamic ';
    }
    DynamicWish.OpenDynamic(deviceInformation);
    onOff = false;
    return 'Turn on sucsessfuly';
  }

  //  All the wishes that are legit to execute from the dynamic class
  String _wishInDynamicClass(WishEnum wish) {
    switch (wish) {
      case WishEnum.SDynamic:
        return _SetDynamicValue();
      case WishEnum.ODynamic:
        return _OpenDynamicValue();
      default:
        return WishInSimpleClass(wish);
    }
  }
}
