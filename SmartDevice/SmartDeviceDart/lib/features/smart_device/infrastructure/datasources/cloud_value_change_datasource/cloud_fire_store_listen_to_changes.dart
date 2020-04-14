import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_datasources/fire_store/data_base_controller.dart';
import 'package:firedart/firestore/models.dart';

class CloudFireStoreListenToChangesDatasource {
  String dataPath = 'smartDevices/guyRoom';
  DataBaseController _dataBaseController;

  CloudFireStoreListenToChangesDatasource() {
    _dataBaseController = DataBaseController();
  }

  Stream<Document> listenAndExecute() async* {
    yield* _dataBaseController.listenToChangeOfDataInPath(dataPath);
  }
}
