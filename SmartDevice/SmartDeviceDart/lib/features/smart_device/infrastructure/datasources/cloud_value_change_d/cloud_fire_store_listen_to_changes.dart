import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/fire_store/data_base_controller.dart';
import 'package:firedart/firestore/models.dart';

class CloudFireStoreListenToChangesDatasource {
//  String dataPath = '/SmartHomes/GuyHome/Rooms/';
  String dataPath = '/SmartHomes/GuyHome/Rooms/';
  String restOfThePath = '/DevicesInTheRoom/Stairs and Storage';
  DataBaseController _dataBaseController;

  CloudFireStoreListenToChangesDatasource() {
    _dataBaseController = DataBaseController();
  }

  Stream<Document> listenAndExecute() async* {
    String fullDataPath = dataPath + SharedVariables.getRoomName() + restOfThePath;
    yield* _dataBaseController.listenToChangeOfDataInPath(fullDataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, bool valueToUpdate) {
    String fullDataPath = dataPath + SharedVariables.getRoomName() + restOfThePath;
    return _dataBaseController.updateDocument(
        fullDataPath, fieldToUpdate, valueToUpdate);
  }
}
