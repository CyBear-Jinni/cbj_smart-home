import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/data/datasources/server/smart_server.dart';
import 'package:test/test.dart';

void main() {
  test('ip list', () async {
    for (NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
      for (InternetAddress addr in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        print("IP: " + addr.address);
      }
    }

    expect(await getIps(), "10.0.0.10");
  });
}
