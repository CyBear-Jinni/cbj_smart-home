import 'dart:async';

import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/entities/local_db_e/local_db_e.dart';
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


  @override
  Stream<SmartDevice> getAllDevices(ServiceCall call, SmartDeviceStatus request) async*{
    print('getAllDevices');
    for(SmartDeviceBaseAbstract smartDeviceBaseAbstract in MySingleton.getSmartDevicesList()) {
      String deviceType = smartDeviceBaseAbstract.runtimeType.toString();

      SmartDevice smartDevice = SmartDevice();
      smartDevice.uuid = smartDeviceBaseAbstract.uuid;
      smartDevice.name = smartDeviceBaseAbstract.smartInstanceName;
      smartDevice.deviceType = deviceType;

      yield smartDevice;
    }

  }

  //  Return the status of the specified device
  @override
  Future<SmartDeviceStatus> getStatus(ServiceCall call,
      SmartDevice request) async {
    var deviceStatus =
        await executeWishEnumString(request, WishEnum.GState, _wishSourceEnum);

    print('Getting status of device ' +
        request.toString() +
        ' and device status in bool ' +
        deviceStatus);
    return SmartDeviceStatus()
      ..onOffState = deviceStatus == 'true' ? true : false;
  }

  @override
  Future<CommendStatus> updateDeviceName(
      ServiceCall call, SmartDeviceUpdateDetails request) {
    print('Updating device name:' +
        request.smartDevice.name +
        ' into: ' +
        request.newName);
    SmartDeviceBaseAbstract smartDevice =
        getSmartDeviceBaseAbstract(request.smartDevice);
    smartDevice.smartInstanceName = request.newName;
    CommendStatus commendStatus = CommendStatus();
    commendStatus.success = true;
    LocalDbE localDbE = LocalDbE();
    localDbE.saveAllDevices(MySingleton.getSmartDevicesList());
    return Future.value(commendStatus);
  }

  @override
  Future<CommendStatus> setOffDevice(
      ServiceCall call, SmartDevice request) async {
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
    return executeWishEnumServer(request, WishEnum.SBlindsUp, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setBlindsDown(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' down');

    return executeWishEnumServer(
        request, WishEnum.SBlindsDown, _wishSourceEnum);
  }


  @override
  Future<CommendStatus> setBlindsStop(ServiceCall call,
      SmartDevice request) async {
    print('Turn blinds ' + request.name + ' stop');

    return executeWishEnumServer(
        request, WishEnum.SBlindsStop, _wishSourceEnum);
  }


  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDevice request) {
    try {
      return MySingleton.getSmartDevicesList().firstWhere((
          smartDeviceBaseAbstractO) =>
      smartDeviceBaseAbstractO.smartInstanceName == request.name);
    }
    catch (exception) {
      print('Exception, device name ' + request.name + ' could not be found: ' +
          exception.message);
      return null;
    }
  }

  CommendStatus executeWishEnumServer(SmartDevice request, WishEnum wishEnum,
      WishEnum) {
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    if (smartDevice == null) {
      return CommendStatus()..success = false;
    }
    ActionsToPreformU.executeWishEnum(smartDevice, wishEnum, _wishSourceEnum);
    return CommendStatus()..success = smartDevice.onOff;
  }

  Future<String> executeWishEnumString(SmartDevice request, WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    SmartDeviceBaseAbstract smartDevice = getSmartDeviceBaseAbstract(request);
    if (smartDevice == null) {
      return "can't find device name";
    }
    return await ActionsToPreformU.executeWishEnum(
        smartDevice, wishEnum, wishSourceEnum);
  }
}