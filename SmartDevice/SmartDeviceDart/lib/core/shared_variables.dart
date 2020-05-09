


class SharedVariables {
  static String _projectRootDirectoryPath; //  Save the location of all the files that were created during the snapcraft
  static String _roomName;

  SharedVariables(String projectRootDirectoryPath, String roomName) {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    _roomName = roomName;
    print('PATH: ' + _projectRootDirectoryPath);
  }


  static String getProjectRootDirectoryPath() => _projectRootDirectoryPath;

  static void setRoomName(String roomName) {
    _roomName = roomName;
  }

  static String getRoomName() => _roomName;
}
