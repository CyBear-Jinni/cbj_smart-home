//  Network action class used for controlling the program in the different network status

import 'dart:async';
import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkActions {

  //  This function starts the connection to the requested wi-fi if the internet connection is down
  Future isConnectedToTheInternet() async {
    print("Status is " + (await isConnectedToInternet()).toString());
    bool processLocation = false; //  true = Started the process to connect to the admin wi-fi, false = waiting for the internet to go down

    Stream<DataConnectionStatus> listener = returnStatusIfChanged();

    listener.listen((status) async {
      bool isConnected = connectionStatusToBool(status);
      if (isConnected) {
        print("Connected to the Internet");
        processLocation = false;
      }
      else {
        print("Does not connected to the Internet");
        processLocation = true;
        await Future.delayed(
            const Duration(seconds: 15)); // Wait to check if internet is back

        // Continue only if internet is till off after timeout
        if (!processLocation) {
          return;
        }

        //  TODO: Get the available networks
        await getAvailableNetworksList("s");
        //  TODO: Keep until the admin wi-fi founded
        //  TODO: Check in between if connection returned with processLocation var
        //  TODO: Connect to admin wi-fi

        print("Finally");
      }
    });
  }

  //  Check to see if admin wifi exist and try to connect to it
  Future<void> connectToAdminWhenExist(String ssid, String pass) async {
    var connectedWifiName = await getConnectedNetworkName();
    while (true) {
      while (connectedWifiName != ssid &&
          !(await getAvailableNetworksList("s")).contains(ssid)) {
        await Future.delayed(
            const Duration(seconds: 15)); // Wait to check if internet is back
        connectedWifiName = await getConnectedNetworkName();
      }
      if (connectedWifiName != ssid) {
        print('Connecting to admin wi-fi');
        await connectToAdminWiFi(ssid: ssid, pass: pass);
      }
      await Future.delayed(
          const Duration(seconds: 15)); // Wait to check if internet is back
      connectedWifiName = await getConnectedNetworkName();
    }
  }

  //  This function check if there is wifi with the name that it got, if true it will try to connect to it with the password that it got
  Future connectToAdminWiFi({String ssid = "ho", String pass = "123"}) async {
    String connectingResult = await connectToWiFi(ssid, pass);
    print('This is connection result');
    print(connectingResult);
  }

  //  Connect to the wi-fi
  Future<String> connectToWiFi(String ssid, String pass) async {
    return await Process.run('nmcli',
        ['dev', 'wifi', 'connect', ssid, 'password', pass]).then((
        ProcessResult results) {
      print(results.stdout.toString());
      return results.stdout.toString();
    });

//      or
    //  Require root
    return await Process.run('iwconfig',
        ['wlp3s0', 'essid', ssid, 'key', pass]).then((ProcessResult results) {
      print(results.stdout.toString());
      return results.stdout.toString();
    });
  }

  //  This function return the new value of the internet connection status only if it changed from last time
  Stream<DataConnectionStatus> returnStatusIfChanged() {
    return DataConnectionChecker().onStatusChange;
  }

  Future<bool> isConnectedToInternet() async {
    return connectionStatusToBool(
        await DataConnectionChecker().connectionStatus);
  }

  //  Convert connection status to true (connected) false (disconnected)
  bool connectionStatusToBool(DataConnectionStatus status) {
    switch (status) {
      case DataConnectionStatus.connected:
        return true;
      case DataConnectionStatus.disconnected:
        return false;
    }
    return false;
  }

  //  Return list of available networks to the device
  Future<List<String>> getAvailableNetworksList(String getSnapPath) async {
//    return await Process.run('nmcli',
//        ['-t', '-f', 'ssid', 'dev', 'wifi']).then((ProcessResult results) {
//      List<String> wifi_results =
//      results.stdout.toString().split("\n");
//      wifi_results = wifi_results.sublist(0, wifi_results.length - 1);
//      wifi_results.forEach((f) {
//        print("This is f:" + f);
//      });
////      print(wifi_results.toString());
//      return wifi_results;
//    });

    return await Process.run(
        getSnapPath + '/scripts/bashScripts/nmcliScript.sh',
        []).then((ProcessResult results) {
      print(results.stdout);
      List<String> stringList = List<String>();
      stringList.add(results.stdout.toString());
      return stringList;
    });
  }

  //  Check if connected to network, if there is a connection than return network name
  Future<String> getConnectedNetworkName() async {
    return await Process.run('iwgetid',
        ['-r']).then((ProcessResult results) {
      print(results.stdout.toString());
      return results.stdout.toString().replaceAll('\n', '');
    });
//    return await Process.run('nmcli',
//        ['-t', '-f', 'ssid,In-USE', 'dev', 'wifi'
//        ]).then((ProcessResult results) {
//      print(results.stdout.toString());
//
//      return results.stdout.toString().replaceAll('\n', '');
//    });
  }

  Future<String> startNetworkManager() async {
    return await Process.run('NetworkManager',
        ['start']).then((ProcessResult results) {
      print(results.stdout.toString());
      return results.stdout.toString();
    });
  }

}