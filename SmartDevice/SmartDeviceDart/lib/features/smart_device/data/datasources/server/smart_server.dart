import 'dart:async';

import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pb.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:SmartDeviceDart/features/smart_device/data/repositories/server_repository.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:grpc/grpc.dart';


class SmartServer extends SmartServerServiceBase {

  ServerRepository serverRepository;

  SmartServer() {
    serverRepository = ServerRepository();
  }

  //  Listening in the background to incoming connections
  Future startListen() async {
    final server = Server([SmartServer()]);
    await server.serve(port: 50051);
    print('Server listening on port ${server.port}...');
  }

  //  Return the status of the specified device
  @override
  Future<SmartDeviceStatus> getStatus(ServiceCall call,
      SmartDevice request) async {
    var deviceStatus = serverRepository.executeWishEnumString(
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
    return serverRepository.executeWishEnum(request, WishEnum.SOff);
  }


  @override
  Future<CommendStatus> setOnDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' on');
    return serverRepository.executeWishEnum(request, WishEnum.SOn);
  }


  @override
  Future<CommendStatus> setBlindsUp(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' up');
    return serverRepository.executeWishEnum(request, WishEnum.blindsUp);
  }


  @override
  Future<CommendStatus> setBlindsDown(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' down');

    return serverRepository.executeWishEnum(request, WishEnum.blindsDown);
  }


  @override
  Future<CommendStatus> setBlindsStop(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' stop');

    return serverRepository.executeWishEnum(request, WishEnum.blindsStop);
  }


  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) =>
      MySingleton.getSmartDevicesList()[int.parse(request.name)];
}