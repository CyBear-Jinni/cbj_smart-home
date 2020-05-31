import 'package:SmartDeviceDart/core/shared_variables.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/fire_store/remote_data_base_controller.dart';
import 'package:firedart/firestore/models.dart';

class CloudFireStoreListenToChangesD {
//  String dataPath = '/SmartHomes/GuyHome/Rooms/';
  String dataPath = '/SmartHomes/GuyHome/Rooms/';
  String restOfThePath = '/DevicesInTheRoom/Stairs and Storage';
  RemoteDataBaseController _dataBaseController;

  CloudFireStoreListenToChangesD() {
    _dataBaseController = RemoteDataBaseController();
  }

  Stream<Document> listenAndExecute() async* {
    String fullDataPath =
        dataPath + SharedVariables.getRoomName() + restOfThePath;
    yield* _dataBaseController.listenToChangeOfDataInPath(fullDataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, bool valueToUpdate) {
    String fullDataPath =
        dataPath + SharedVariables.getRoomName() + restOfThePath;
    return _dataBaseController.updateDocument(
        fullDataPath, fieldToUpdate, valueToUpdate);
  }
}
