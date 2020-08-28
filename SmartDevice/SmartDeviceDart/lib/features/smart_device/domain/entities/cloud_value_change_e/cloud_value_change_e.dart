import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/cloud_value_change_r/cloud_value_change_r.dart';
import 'package:firedart/firestore/models.dart';

class CloudValueChangeE {
  static CloudManagerR _cloudManager;

  CloudValueChangeE(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    if (firebaseAccountsInformationD.fireBaseProjectId != null &&
        firebaseAccountsInformationD.fireBaseApiKey != null &&
        firebaseAccountsInformationD.userEmail != null &&
        firebaseAccountsInformationD.userPassword != null) {
      _cloudManager ??= CloudManagerR(firebaseAccountsInformationD);
//    MySingleton.getSmartDevicesList()[0];
    }
  }

  Stream<Document> listenToDataBase() async* {
    yield* _cloudManager.listenToDataBase();
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _cloudManager.updateDocument(fieldToUpdate, valueToUpdate);
  }
}
