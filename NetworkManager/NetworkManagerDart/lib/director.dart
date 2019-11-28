import 'network_actions.dart';

// This class is where all the program start after the main file
class Director {
  Director() {
    NetworkActionsMainAsync();
  }

  Future NetworkActionsMainAsync() async {

    print('next');

    createServer();
    connectToDatabase();

    await ManegeNetworkConnection();


  }

  //  This function starts the object to manege the state of the device network connection
  void ManegeNetworkConnection() {
    NetworkActions networkActions = NetworkActions();
    networkActions.getAvailableNetworksList();
//    networkActions.isConnectedToTheInternet();
    print("Go to sleep");
  }

  // This function connect to the data base
  void connectToDatabase() {}

  //  This function will create the server in case there is connection
  void createServer() {}
}
