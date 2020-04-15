import 'dart:async';

import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:grpc/grpc.dart';


// This class get what to execute straight from the grpc request,
class SmartServerU extends SmartServerServiceBase {

  //  Listening to port and deciding what to do with the response
  void waitForConnection() {
    print('Wait for connection');
    var smartServer = SmartServerU();
    smartServer
        .startListen(); // Will go throw the model with the grpc logic and converter to objects
  }

  //  Listening in the background to incoming connections
  Future startListen() async {
    final server = Server([SmartServerU()]);
    await server.serve(port: 50051);
    print('Server listening on port ${server.port}...');
  }

  //  Return the status of the specified device
  @override
  Future<SmartDeviceStatus> getStatus(ServiceCall call,
      SmartDevice request) async {
    var deviceStatus = executeWishEnumString(
        request, WishEnum.GState);

    print('Getting status of device ' + request.toString() +
        ' and device status in bool ' + deviceStatus);
    return SmartDeviceStatus()
      ..onOffState = deviceStatus == 'true' ? true : false;
  }


  @override
  Future<CommendStatus> setOffDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' off');
    return executeWishEnumServer(request, WishEnum.SOff);
  }


  @override
  Future<CommendStatus> setOnDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' on');
    return executeWishEnumServer(request, WishEnum.SOn);
  }


  @override
  Future<CommendStatus> setBlindsUp(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' up');
    return executeWishEnumServer(request, WishEnum.blindsUp);
  }


  @override
  Future<CommendStatus> setBlindsDown(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' down');

    return executeWishEnumServer(request, WishEnum.blindsDown);
  }


  @override
  Future<CommendStatus> setBlindsStop(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' stop');

    return executeWishEnumServer(request, WishEnum.blindsStop);
  }


  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) =>
      MySingleton.getSmartDevicesList()[int.parse(request.name)];

  CommendStatus executeWishEnumServer(SmartDevice request, WishEnum wishEnum) {
    var smartDevice =
    MySingleton.getSmartDevicesList()[int.parse(request.name)];
    ActionsToPreform.executeWishEnum(smartDevice, wishEnum);
    return CommendStatus()
      ..success = smartDevice.onOff;
  }

  String executeWishEnumString(SmartDevice request, WishEnum wishEnum) {
    var smartDevice =
    MySingleton.getSmartDevicesList()[int.parse(request.name)];

    return ActionsToPreform.executeWishEnum(smartDevice, wishEnum);
  }
}