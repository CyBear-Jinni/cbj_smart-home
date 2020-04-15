import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/cloud_value_change_r/cloud_value_change_r.dart';
import 'package:firedart/firestore/models.dart';

class CloudValueChangeE {
  CloudManagerR _cloudManager;

  CloudValueChangeE() {
    _cloudManager = CloudManagerR();
    MySingleton.getSmartDevicesList()[0];
  }

  Stream<Document> listenToDataBase() async* {
    yield* _cloudManager.listenToDataBase();
  }
}
