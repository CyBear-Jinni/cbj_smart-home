import 'package:SmartDeviceDart/features/smart_device/data/datasources/fire_store/data_base_controller.dart';

class CloudFireStoreListenToChanges {
  String dataPath = "smartDevices/guyRoom";

  void listenAndExecute() {
    DataBaseController dataBaseController = DataBaseController();
    dataBaseController.listenToChangeOfDataInPath(dataPath).listen(
        (onData) => onData.listen((data2) => data2.listen((document) async {
              //  Find what action is nedded with the
//                  EnumHelper.wishEnumToString("");
              //  Trunsfer to the action to do with the model

              String value = await dataBaseController.getValueOfLamp(
                  document, "ceilingLamp");
              if (value == 'true') {
                print('cloud firestore is true');
//                    String smartDeviceResponse =
//                    await smartDevice.WishInBaseClass(WishEnum.SOn);
//                    print(smartDeviceResponse);
              } else {
                print('cloud firestore is false');
//                    String smartDeviceResponse =
//                    await smartDevice.WishInBaseClass(WishEnum.SOff);
//                    print(smartDeviceResponse);
              }
            })));
  }
}
