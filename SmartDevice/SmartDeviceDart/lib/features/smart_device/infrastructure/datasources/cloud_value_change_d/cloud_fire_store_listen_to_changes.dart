import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/fire_store/data_base_controller.dart';
import 'package:firedart/firestore/models.dart';

class CloudFireStoreListenToChangesDatasource {
  String dataPath = 'smartDevices/';
  DataBaseController _dataBaseController;

  CloudFireStoreListenToChangesDatasource() {
    _dataBaseController = DataBaseController();
  }

  Stream<Document> listenAndExecute() async* {
    String fullDataPath = dataPath + SharedVariables.getRoomName();
    yield* _dataBaseController.listenToChangeOfDataInPath(fullDataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, bool valueToUpdate) {
    String fullDataPath = dataPath + SharedVariables.getRoomName();
    return _dataBaseController.updateDocument(
        fullDataPath, fieldToUpdate, valueToUpdate);
  }
}
