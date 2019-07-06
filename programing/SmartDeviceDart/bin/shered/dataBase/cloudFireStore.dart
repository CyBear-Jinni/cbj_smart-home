import 'dart:convert';

import 'package:http/http.dart' as http;

class CloudFireStore {
  String auth = 'vA8JV5FBKFUTiJNnODjc9s1V9y0N0yJvH2ST0WG0';
  String urlToDataBase =
      'https://firestore.googleapis.com/v1/projects/smarthome-3765e/databases/(default)/documents';

  // '/users/aturing' as input
  Future<String> getData(String path, fieldName) async {
    path = path + '?fields=fields';
    String fullPath = urlToDataBase + path;
    return await http.get(fullPath).then((http.Response response) async {
      Map<String, Map<String, dynamic>> map =
          Map.castFrom(json.decode(response.body));

//      tryMe(map);
      return map['fields'][fieldName]['stringValue'].toString();
    });
  }
}
