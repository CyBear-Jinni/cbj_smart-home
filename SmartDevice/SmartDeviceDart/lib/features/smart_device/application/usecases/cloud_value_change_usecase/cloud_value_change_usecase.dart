import 'package:SmartDeviceDart/features/smart_device/domain/entities/cloud_value_change_entitiy/cloud_value_change_entity.dart';

class CloudValueChangeUseCase {
  CloudValueChangeEntity _cloudValueChangeEntity;

  CloudValueChangeUseCase() {
    _cloudValueChangeEntity = CloudValueChangeEntity();
  }

  //  Listen to changes in the database for this device
  void listenToDataBase() {
    _cloudValueChangeEntity.listenToDataBase();
  }
}
