import 'network_actions.dart';

// This class is where all the program start after the main file
class Director {
  String snapPath;

  Director(this.snapPath) {
    NetworkActionsMainAsync();
  }


  Future NetworkActionsMainAsync() async {

    print('next');

    createServer();
    connectToDatabase();

    await ManegeNetworkConnection();


  }

  //  This function starts the object to manege the state of the device network connection
  Future ManegeNetworkConnection() async {
    NetworkActions networkActions = NetworkActions(
        'AndroidAP_6194', '7f1ee6787744', 'WiFi-ssid', 'WiFi-password');

    await networkActions.connectToAdminWhenExist();
  }

  // This function connect to the data base
  void connectToDatabase() {}

  //  This function will create the server in case there is connection
  void createServer() {}
}
