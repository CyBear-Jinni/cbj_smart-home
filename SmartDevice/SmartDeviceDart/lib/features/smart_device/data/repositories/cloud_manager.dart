import 'package:SmartDeviceDart/features/smart_device/data/datasources/fire_store/cloud_fire_store_listen_to_changes.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/cloud_manager_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';

class CloudManager extends CloudManagerAbstract {

  SmartDeviceBaseAbstract smartDevice;
  CloudFireStoreListenToChanges cloudFireStoreListenToChanges;


  CloudManager(this.smartDevice) {
    cloudFireStoreListenToChanges = CloudFireStoreListenToChanges();
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    cloudFireStoreListenToChanges.listenAndExecute();
  }
}
