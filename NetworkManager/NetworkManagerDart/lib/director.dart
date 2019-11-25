// This class is where all the program start after the main file

import 'dart:io';

class Director {
  Director() {
    NetworkActionsMainAsync();
  }

  Future NetworkActionsMainAsync() async {
    try {
      await HttpServer.bind(InternetAddress, 4044).then((var a) {
        print('sad');
      });
    } catch (e, s) {
      print(s);
    }
    print('next');
    ManegeNetworkConnection();

    createServer();
    connectToDatabase();
  }

  //  This function start the object to manege the state of the device network connection
  void ManegeNetworkConnection() {}

  // This function connect to the data base
  void connectToDatabase() {}

  //  This function will create the server in case there is connection
  void createServer() {}
}
