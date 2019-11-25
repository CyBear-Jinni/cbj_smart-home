import 'dart:async';

import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';

class CloudFireStore {
  static const apiKey = "AIzaSyBIEgdRhns2gX7xTLIVlgfqcK87RTXdAIo";
  static const projectId = "smarthome-3765e";
  static const email = "guyhome@gmail.com";
  static const password = "123IsNotSecure";

  StreamController<Document> streamController = StreamController<Document>();

  //  Get

  //  Get data from path
  getData(String dataPath) {
    return "Data in path from server";
  }

  //  Get specific field from path
  getFieldInPath(String dataPath, String field) {
    return "Data in path from server where equels to field";
  }

  //  Set

  //  Set the data in field
  String setDataInField(String dataPath, String dataToSave) {}

  //  Update the data in field
  String updateDataInField(String dataPath, String dataToSave) {}

  //  Listen to changes of the data in path and return the value that change each time there is change
  Stream<Stream<Document>> listenToChangeOfDataInPath(String dataPath) async* {
    FirebaseAuth auth = FirebaseAuth(apiKey, VolatileStore());
    Firestore fireStore =
    Firestore(projectId, auth: auth); //  FireStore reuses the auth client

    //  Monitor sign-in state
    auth.signInState.listen((state) {
      return print("Signed ${state ? "in" : "out"}");
    });

    //  Sign in with user credentials
    try {
      await auth.signIn(email, password);

      //  Get user object
      User user = await auth.getUser();
      print(user);

      //  Instantiate a reference to a document - this happens offline
      DocumentReference ref = fireStore.document(dataPath);

      //  Subscribe to changes to that document
      yield ref.subscribe();

//
//    //  Update the document
//    await ref.update({"value": "test"});
//
//    //  Get a snapshot of the document
      Document document = await ref.get();

//    print("snapshot: ${document["value"]}");

      auth.signOut();
    }
    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }


//  Helper methods
//  DocumentReference transferStringToPath(String pathString){
//  }
}
