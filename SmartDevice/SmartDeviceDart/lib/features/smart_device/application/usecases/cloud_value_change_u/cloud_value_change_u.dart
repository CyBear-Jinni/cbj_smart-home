import 'package:SmartDeviceDart/features/smart_device/domain/entities/cloud_value_change_e/cloud_value_change_e.dart';

class CloudValueChangeU {
  CloudValueChangeE _cloudValueChangeEntity;

  CloudValueChangeU() {
    _cloudValueChangeEntity = CloudValueChangeE();
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    _cloudValueChangeEntity.listenToDataBase();
  }
}
