import 'package:hive/hive.dart';

part 'hive_devices_d.g.dart';

@HiveType(typeId: 2)
class HiveDevicesD {
  @HiveField(0)
  Map<String, List<String>> smartDeviceList;
}
