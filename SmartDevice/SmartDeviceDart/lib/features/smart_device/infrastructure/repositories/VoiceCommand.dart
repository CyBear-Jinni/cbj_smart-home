import 'package:SmartDeviceDart/features/smart_device/application/usecases/actions_to_preform.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/voice_command_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/server/protoc_as_dart/smart_connection.pb.dart';

class VoiceCommand extends VoiceCommandAbstract {
  @override
  CommendStatus executeWishEnum(SmartDeviceBaseAbstract request,
                                WishEnum wishEnum) {
    ActionsToPreform.executeWishEnum(request, wishEnum);
    return CommendStatus()
      ..success = request.onOff;
  }

  String executeWishEnumString(SmartDevice request, WishEnum wishEnum) {
    var smartDevice =
    MySingleton.getSmartDevicesList()[int.parse(request.name)];

    return ActionsToPreform.executeWishEnum(smartDevice, wishEnum);
  }

  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) =>
      MySingleton.getSmartDevicesList()[int.parse(request.name)];
}
