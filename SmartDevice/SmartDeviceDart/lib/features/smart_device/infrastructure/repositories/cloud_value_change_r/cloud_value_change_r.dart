import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/cloud_value_change_d/cloud_fire_store_listen_to_changes.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/cloud_value_change_r/cloud_value_change_r_abstract.dart';
import 'package:firedart/firestore/models.dart';

class CloudManagerR extends CloudManagerRAbstract {
  CloudFireStoreListenToChangesDatasource cloudFireStoreListenToChanges;

  CloudManagerR() {
    cloudFireStoreListenToChanges = CloudFireStoreListenToChangesDatasource();
  }

  //  Listen to changes in the database for this device
  Stream<Document> listenToDataBase() async* {
    yield* cloudFireStoreListenToChanges.listenAndExecute();
  }
}
