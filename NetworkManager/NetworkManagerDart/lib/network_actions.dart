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
        await getAvailableNetworksList();
        //  TODO: Keep until the admin wi-fi founded
        //  TODO: Check in between if connection returned with processLocation var
        //  TODO: Connect to admin wi-fi

        print("Finally");
      }
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

  Future<List<String>> getAvailableNetworksList() async {
    return await Process.run('nmcli',
        ['dev' + 'wifi']).then((ProcessResult results) {
      print(results.stdout.toString());
      print('By by here');
      List<String> wifi_results = List();
      wifi_results.add('asd');
      return wifi_results;
    });
  }
}
