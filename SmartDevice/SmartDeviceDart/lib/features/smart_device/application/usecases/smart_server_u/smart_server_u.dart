import 'dart:async';

import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:grpc/grpc.dart';


// This class get what to execute straight from the grpc request,
class SmartServerU extends SmartServerServiceBase {

  static const WishSourceEnum _wishSourceEnum = WishSourceEnum.ServerRequest;

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
        request, WishEnum.GState, _wishSourceEnum);

    print('Getting status of device ' + request.toString() +
        ' and device status in bool ' + deviceStatus);
    return SmartDeviceStatus()
      ..onOffState = deviceStatus == 'true' ? true : false;
  }


  @override
  Future<CommendStatus> setOffDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' off');
    return executeWishEnumServer(request, WishEnum.SOff, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setOnDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' on');
    return executeWishEnumServer(request, WishEnum.SOn, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setBlindsUp(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' up');
    return executeWishEnumServer(request, WishEnum.blindsUp, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setBlindsDown(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' down');

    return executeWishEnumServer(request, WishEnum.blindsDown, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setBlindsStop(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' stop');

    return executeWishEnumServer(request, WishEnum.blindsStop, _wishSourceEnum);
  }


  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) {
    try {
      return MySingleton.getSmartDevicesList().firstWhere((
          smartDeviceBaseAbstractO) =>
      smartDeviceBaseAbstractO.deviceName == request.name);
    }
    catch (exception) {
      print('Exception, device name ' + request.name + ' could not be found: ' +
          exception.message);
      return null;
    }
  }

  CommendStatus executeWishEnumServer(SmartDevice request, WishEnum wishEnum,
      WishEnum) {
    var smartDevice = getSmartDeviceBaseAbstract(request);
    ActionsToPreformU.executeWishEnum(smartDevice, wishEnum, _wishSourceEnum);
    return CommendStatus()
      ..success = smartDevice.onOff;
  }

  String executeWishEnumString(SmartDevice request, WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) {
    var smartDevice = getSmartDeviceBaseAbstract(request);
    if (smartDevice == null) {
      return "can't find device name";
    }
    return ActionsToPreformU.executeWishEnum(
        smartDevice, wishEnum, wishSourceEnum);
  }
}