import 'package:smart_home_flutter/objects/enums.dart';
import 'package:smart_home_flutter/objects/smart_device/smart_blinds_object.dart';
import 'package:smart_home_flutter/objects/smart_device/smart_device_objcet.dart';
import 'package:smart_home_flutter/objects/smart_device/smart_room_object.dart';


final List<SmartRoomObject> rooms = [room1, room2, room3, room4];

SmartRoomObject room1 = SmartRoomObject(
    "Guy", room1DevicesList, blindsInTheRoom: room1blindsList);
SmartRoomObject room2 = SmartRoomObject('Kitchen', room2DevicesList);
SmartRoomObject room3 = SmartRoomObject('Outside', room3DevicesList);
SmartRoomObject room4 = SmartRoomObject('Bar', room4DevicesList);
SmartRoomObject room5 = SmartRoomObject('Sami', room5DevicesList);


//  Room lights
final List<SmartDeviceObject> room1DevicesList = [
  SmartDeviceObject(DeviceType.Light, 'Guy main', '10.0.0.23', 'Guy room'),
  SmartDeviceObject(DeviceType.Light, 'Guy bed', '10.0.0.24', 'Guy room'),
  SmartDeviceObject(DeviceType.Light, 'Guy desk', '10.0.0.50', 'Guy room')
];

final List<SmartDeviceObject> room2DevicesList = [
  SmartDeviceObject(
      DeviceType.Light, 'Kitchen main', '10.0.0.21', 'Kitchen room'),
  SmartDeviceObject(
      DeviceType.Light, 'Kitchen table', '10.0.0.22', 'Kitchen room'),
  SmartDeviceObject(
      DeviceType.Light, 'Kitchen main', '10.0.0.51', 'Kitchen room')
];

final List<SmartDeviceObject> room3DevicesList = [
  SmartDeviceObject(DeviceType.Light, 'Outside stairs', '10.0.0.30'),
  SmartDeviceObject(DeviceType.Light, 'Outside storage', '10.0.0.30'),
  SmartDeviceObject(DeviceType.Light, 'Outside main', '10.0.0.14')
];

final List<SmartDeviceObject> room4DevicesList = [
  SmartDeviceObject(DeviceType.Light, 'Bar main', '10.0.0.10', 'Bar room'),
  SmartDeviceObject(DeviceType.Light, 'Bar bed', '10.0.0.10', 'Bar room'),
  SmartDeviceObject(DeviceType.Light, 'Bar stairs', '10.0.0.19', 'Bar room')
];

final List<SmartDeviceObject> room5DevicesList = [
  SmartDeviceObject(DeviceType.Light, 'Sami main', '10.0.0.11', 'Sami room'),
  SmartDeviceObject(DeviceType.Light, 'Sami bed', '10.0.0.12', 'Sami room'),
  SmartDeviceObject(DeviceType.Light, 'Sami stairs', '10.0.0.16', 'Sami room')
];

// Room BlindsonOffState

final List<SmartBlindsObject> room1blindsList = [
  SmartBlindsObject(DeviceType.Blinds, 'South blinds', '10.0.0.24'),
];