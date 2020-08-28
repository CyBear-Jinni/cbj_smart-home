import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:hive/hive.dart';

part 'hive_devices_d.g.dart';

@HiveType(typeId: 2)
class HiveDevicesD {
  @HiveField(0)
  Map<String, List<String>> smartDeviceList;
  @HiveField(1)
  FirebaseAccountsInformationD databaseInformationList;
}
