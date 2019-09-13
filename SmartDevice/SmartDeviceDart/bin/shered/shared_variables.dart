
class SharedVariables{
  static String _snapPath; // Save the location of all the files that were created during the snapcraft

  SharedVariables(String snapPath){
    _snapPath = snapPath;
  }

  static String getSnapPath() => _snapPath;
}