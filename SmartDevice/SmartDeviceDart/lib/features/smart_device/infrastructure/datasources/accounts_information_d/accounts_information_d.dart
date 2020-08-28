// keys to extract account information from the database
class AccountsInformationD {
  static String fireBaseProjectId = 'fireBaseProjectId';
  static String fireBaseApiKey = 'fireBaseApiKey';
  static String userEmail = 'userEmail';
  static String userPassword = 'userPassword';
}

// firebase Account information
class FirebaseAccountsInformationD {
  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  FirebaseAccountsInformationD(this.fireBaseProjectId, this.fireBaseApiKey,
      this.userEmail, this.userPassword);

  bool areAllValuesNotNull() {
    return fireBaseProjectId != null &&
        fireBaseApiKey != null &&
        userEmail != null &&
        userPassword != null;
  }
}
