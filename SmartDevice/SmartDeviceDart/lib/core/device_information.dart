

//  Save data about the device, is it remote or local, what pin/ip does it have
class DeviceInformation {
  final String _uuid; //  uuid of the device
  final String _name; //  Name of the device

  DeviceInformation(this._uuid, this._name);

  //  Getters

  String getUuid() => _uuid;

  String getName() => _name;
}

class RemoteDevice extends DeviceInformation {
  String ip; //  Ip of the device


  RemoteDevice(String uuid, String name, this.ip)
      : super(uuid, name);


  //  Get


  String getIp() => ip;
}

class LocalDevice extends DeviceInformation {

  LocalDevice(String uuid, String name) : super(uuid, name);
}
