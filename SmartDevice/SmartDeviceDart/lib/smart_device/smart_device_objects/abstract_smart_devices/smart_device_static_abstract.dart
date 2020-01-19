import '../../../shered/enums.dart';
import 'smart_device_base_abstract.dart';

//  Abstract class for devices with property of how much to move and without how much time the device is doing action without stopping
abstract class SmartDeviceStaticAbstract extends SmartDeviceBaseAbstract {


  SmartDeviceStaticAbstract(macAddress, deviceName, onOffPinNumber,
      {onOffButtonPinNumber}) : super(macAddress, deviceName, onOffPinNumber,
      onOffButtonPinNumber: onOffButtonPinNumber);

  //  TODO: set how much to move
  String _HowMuchToMove() {
    return "How much to move not supported yet";
//    if(deviceInformation == null) {
//      return "Device information is missing, cant trun off";
//    }
//    DynamicWish.OpenDynamic(deviceInformation);
//    onOff = false;
//    return 'Turn on sucsessfuly';
  }

  //  All the wishes that are legit to execute from the static class
  @override
  Future<String> ExecuteWish(String wishString) async {
    WishEnum wish = ConvertWishStringToWishesObject(wishString);
    print(wishString);
    print(wish.toString());
    if (wish == null) return "Your wish does not exist on static class";
    return WishInStaticClass(wish);
  }


  String WishInStaticClass(WishEnum wish) {
    switch (wish) {
      case WishEnum.SMovement:
        return _HowMuchToMove();
      default:
        return WishInBaseClass(wish);
    }
  }
}
