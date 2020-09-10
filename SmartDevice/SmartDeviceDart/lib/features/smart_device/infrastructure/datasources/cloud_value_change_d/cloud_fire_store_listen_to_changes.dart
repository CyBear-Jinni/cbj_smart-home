import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/fire_store/remote_data_base_controller.dart';
import 'package:firedart/firestore/models.dart';

class CloudFireStoreListenToChangesD {
  String dataPath = '/SmartHomes/GuyHome/Devices/Lights';
  RemoteDataBaseController _dataBaseController;

  CloudFireStoreListenToChangesD(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _dataBaseController =
        RemoteDataBaseController(firebaseAccountsInformationD);
  }

  Stream<Document> listenAndExecute() async* {
    yield* _dataBaseController.listenToChangeOfDataInPath(dataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _dataBaseController.updateDocument(
        dataPath, fieldToUpdate, valueToUpdate);
  }
}
