import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/cloud_value_change_datasource/cloud_fire_store_listen_to_changes.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/cloud_value_change_repository/cloud_value_change_repository_abstract.dart';
import 'package:firedart/firestore/models.dart';

class CloudManagerRepository extends CloudManagerRepositoryAbstract {
  CloudFireStoreListenToChangesDatasource cloudFireStoreListenToChanges;

  CloudManagerRepository() {
    cloudFireStoreListenToChanges = CloudFireStoreListenToChangesDatasource();
  }

  //  Listen to changes in the database for this device
  Stream<Document> listenToDataBase() async* {
    yield* cloudFireStoreListenToChanges.listenAndExecute();
  }
}
