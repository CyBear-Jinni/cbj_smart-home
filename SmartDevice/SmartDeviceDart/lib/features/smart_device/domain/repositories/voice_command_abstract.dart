import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/server/protoc_as_dart/smart_connection.pb.dart';

abstract class VoiceCommandAbstract {
	CommendStatus executeWishEnum(SmartDeviceBaseAbstract request,
	                              WishEnum wishEnum);
}
