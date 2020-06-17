import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_store_d.dart';
import 'package:firedart/firedart.dart';

class CloudFireStoreD {
  static const apiKey = 'AIzaSyBIEgdRhns2gX7xTLIVlgfqcK87RTXdAIo';
  static const projectId = 'smarthome-3765e';
  static const email = 'guyhome@gmail.com';
  static const password = '123IsNotSecure';

  FirebaseAuth auth;

  CloudFireStoreD() {
    try {
      initializeFirebaseAuthWithHivePersistingTokens();
    } catch (exception) {
      print('This is exception initializing : ' + exception.toString());
    }
  }

  Future initializeFirebaseAuthWithHivePersistingTokens() async {
    try {
      await HiveD();
      await Firestore.initialize(projectId); // Firestore reuses the auth client
      await FirebaseAuth.initialize(apiKey, await HiveStore.create());
      await FirebaseAuth.instance.signIn(email, password);
//      var user = await FirebaseAuth.instance.getUser();
    } catch (exception) {
      print('This was the exception here: ' + exception.toString());
    }
  }

  //  Set the data in field
  void setDataInField(String dataPath, String dataToSave) async {
    //  Sign in with user credentials
    try {
      //  Instantiate a reference to a document - this happens offline
      var ref = Firestore.instance.document(dataPath);
      //  Update the document
      await ref.set({'value': dataToSave});
    }

    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }


  //  Get data from path
  String getData(String dataPath) {
    return 'Data in path from server';
  }

  //  Get specific field from path
  String getFieldInPath(String dataPath, String field) {
    return 'Data in path from server where equals to field';
  }

  //  Listen to changes of the data in path and return the value that change each time there is change
  Stream<Document> listenToChangeOfDataInPath(String dataPath) async* {
    //  Sign in with user credentials
    try {
      //  Instantiate a reference to a document - this happens offline
      var ref = Firestore.instance.document(dataPath);

      //  Subscribe to changes to that document
      yield* ref.stream;
//
//    //  Get a snapshot of the document
//      var document = await ref.get();

//    print("snapshot: ${document["value"]}");

    }
    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }


  Future <String> updateDataInBoolField(String dataPath, String fieldToUpdate,
      bool valueToUpdate) async {
    try {
      //  Instantiate a reference to a document - this happens offline
      var ref = Firestore.instance.document(dataPath);
      //  Update the document
      await ref.update({fieldToUpdate: valueToUpdate});
    }

    catch (error) {
      print("Can't reach server, error: " + error.toString());
      return "Can't reach server, error: " + error.toString();
    }
    return 'Success';
  }

}
