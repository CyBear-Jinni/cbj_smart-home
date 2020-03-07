import 'dart:async';
import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pb.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:SmartDeviceDart/features/smart_device/data/repositories/server_repository.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/enums.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/smart_device_objects/static_devices/blinds_object.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/smart_device_base_abstract.dart';
import 'package:grpc/grpc.dart';


class SmartServer extends SmartServerServiceBase {

  SmartServer();

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
    var smartDevice = MySingleton.getSmartDevicesList()[int.parse(
        request.name)];
    String deviceStatus = smartDevice.WishInBaseClass(WishEnum.GState);

    print('Getting status of device ' +
        request.toString() +
        ' and device status in bool ' +
        deviceStatus);
    return SmartDeviceStatus()
      ..onOffState = deviceStatus == 'true' ? true : false;
  }


  @override
  Future<CommendStatus> setOffDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' off');
    ServerRepository serverRepository = ServerRepository();
    return serverRepository.executeWishEnum(request, WishEnum.SOff);
  }


  @override
  Future<CommendStatus> setOnDevice(ServiceCall call,
      SmartDevice request) async {
    print('Turn device ' + request.name + ' on');
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    String deviceStatus = smartDevice.WishInBaseClass(WishEnum.SOn);
    print('Device state is ' + smartDevice.onOff.toString());

    return CommendStatus()..success = smartDevice.onOff;
  }


  @override
  Future<CommendStatus> setBlindsUp(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' up');
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    BlindsObject blindsObject = smartDevice as BlindsObject;
    String deviceStatus = await blindsObject.WishInBlindsClass(
        WishEnum.blindsUp);

    return await CommendStatus()
      ..success;
  }


  @override
  Future<CommendStatus> setBlindsDown(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' down');
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    BlindsObject blindsObject = smartDevice as BlindsObject;
    String deviceStatus = await blindsObject.WishInBlindsClass(
        WishEnum.blindsDown);

    return await CommendStatus()
      ..success;
  }


  @override
  Future<CommendStatus> setBlindsStop(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' stop');
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    BlindsObject blindsObject = smartDevice as BlindsObject;
    String deviceStatus = await blindsObject.WishInBlindsClass(
        WishEnum.blindsStop);

    return await CommendStatus()
      ..success;
  }


  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) =>
      MySingleton.getSmartDevicesList()[int.parse(request.name)];
}

//  Get Ip info
Future<String> getIps() async {
  for (NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
    for (InternetAddress address in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      return address.address;
    }
  }
  return null;
}
