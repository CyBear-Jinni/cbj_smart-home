import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pb.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_server_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/usecases/actions_to_preform.dart';

class ServerRepository implements SmartServerAbstract {
  @override
  CommendStatus executeWishEnum(SmartDevice request, WishEnum wishEnum) {
    SmartDeviceBaseAbstract smartDevice =
        MySingleton.getSmartDevicesList()[int.parse(request.name)];
    ActionsToPreform.executeWishEnum(smartDevice, wishEnum);
    return CommendStatus()..success = smartDevice.onOff;
  }

  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) =>
      MySingleton.getSmartDevicesList()[int.parse(request.name)];
}
