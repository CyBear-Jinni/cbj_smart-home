import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/cloud_value_change_repository/cloud_value_change_repository.dart';
import 'package:firedart/firestore/models.dart';

class CloudValueChangeEntity {
  CloudManagerRepository _cloudManager;

  CloudValueChangeEntity() {
    _cloudManager = CloudManagerRepository();
    MySingleton.getSmartDevicesList()[0];
  }

  Stream<Document> listenToDataBase() async* {
    yield* _cloudManager.listenToDataBase();
  }
}
