import 'dart:io';

class CommonBashCommendsD {
  static Future<String> getCurrentUserName() async {
    String whoami =
        await Process.run('whoami', []).then((ProcessResult result) {
      return result.stdout; //  This is mock mac address
    });
    return whoami.substring(0, whoami.indexOf('\n'));
  }

  static Future<String> getUuidOfCurrentDevice() async {
    String df =
        await Process.run('df', ['-h', '/']).then((ProcessResult result) {
      return result.stdout;
    });

    df = df.substring(df.indexOf('\n') + 1);
    df = df.substring(0, df.indexOf(' '));

    //  The full bash command looks like this /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"
    String blkid =
        await Process.run('/sbin/blkid', []).then((ProcessResult result) {
      return result.stdout;
    });

    blkid = blkid.substring(blkid.indexOf(df));
    blkid = blkid.substring(0, blkid.indexOf('\n'));

    String uuid = blkid.substring(blkid.indexOf('UUID="') + 6);
    uuid = uuid.substring(0, uuid.indexOf('"'));

    return uuid;
  }

  static Future<String> getDeviceHostName() async {
    String hostName =
    await Process.run('hostname', ['-s']).then((ProcessResult result) {
//      String hostName = result.stdout;
//      hostName = hostName.substring(
//          0, hostName.length - 1); //  Removes the invisible new line at the end
//      print('Host name: ' + hostName);
      return result.stdout;
    });
    return hostName.substring(0, hostName.indexOf('\n'));
  }

  static Future<String> getFileContent(fileFullPath) async {
    String fileContent =
        await Process.run('cat', [fileFullPath]).then((ProcessResult result) {
      return result.stdout;
    });

    if (fileContent == '') {
      return null;
    }
    return fileContent;
  }

  static Future<String> getUserName() {}
}
