import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pb.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';

abstract class SmartServerAbstract {
  CommendStatus executeWishEnum(SmartDevice request, WishEnum wishEnum);
}
