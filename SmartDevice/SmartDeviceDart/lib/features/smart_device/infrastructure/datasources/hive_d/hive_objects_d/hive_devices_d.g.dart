// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_devices_d.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDevicesDAdapter extends TypeAdapter<HiveDevicesD> {
  @override
  final typeId = 2;

  @override
  HiveDevicesD read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDevicesD()
      ..smartDeviceList = (fields[0] as Map)?.map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List)?.cast<String>()));
  }

  @override
  void write(BinaryWriter writer, HiveDevicesD obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.smartDeviceList);
  }
}
