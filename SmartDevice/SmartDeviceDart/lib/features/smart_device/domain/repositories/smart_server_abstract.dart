import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/server/protoc_as_dart/smart_connection.pb.dart';

abstract class SmartServerAbstract {
  CommendStatus executeWishEnum(SmartDevice request, WishEnum wishEnum);
}
