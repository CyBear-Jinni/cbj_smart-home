import '../../../shered/enums.dart';
import 'smart_device_base_abstract.dart';

//  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  double
  howMuchTimeTheDeviceDoingAction; //  How much time the smart device was active (Doing action) continuously


  SmartDeviceSimpleAbstract(macAddress, deviceName,
      onOffPinNumber, {onOffButtonPinNumber}) : super(macAddress, deviceName,
      onOffPinNumber, onOffButtonPinNumber: onOffButtonPinNumber);


  @override
  Future<String> ExecuteWish(String wishString) async {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    return WishInSimpleClass(wish);
  }

  //  All the wishes that are legit to execute from the simple class
  String WishInSimpleClass(WishEnum wish) {
    if (wish == null) return "Your wish does not exist on simple class";
    return WishInBaseClass(wish);
  }
}
