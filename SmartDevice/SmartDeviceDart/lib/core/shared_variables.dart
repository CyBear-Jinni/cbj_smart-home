


class SharedVariables {
  static String _projectRootDirectoryPath; //  Save the location of all the files that were created during the snapcraft


  SharedVariables(String projectRootDirectoryPath) {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    print('PATH: ' + _projectRootDirectoryPath);
  }


  static String GetProjectRootDirectoryPath() => _projectRootDirectoryPath;
}
