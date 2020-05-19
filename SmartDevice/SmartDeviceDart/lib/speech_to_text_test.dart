// bin/list_files.dart

import 'package:googleapis/storage/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/speech/v1.dart';

final _credentials = ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "smarthome-3765e",
  "private_key_id": "6db46c39640455900dcebf16cbc2bccfffd7d6ff",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCfEx03Y0MqGjVX\n/8K1a8djGIHoyS1bHwPLUpufutV4p+DtanKe8c2s5Y9RZDZCHE5jCi/znw0lxMiG\n648lx4dtymbG44RG/JsViyQAUIxXGTHPBbDm84zS2NuQvUTM8BrJsg34qlcsBXfB\nY+csrKKZrq0+8mnyxT7K5/pmltj63LooufT1cWgNs6oyIVtWr2/0JUjh4bfviJ5w\naIHw+T6tituMOpv/7F4LrbCxu6yy5D0sn6QKg6t2o5IDv+mtIdNkGhKPdh7OhTKK\nXLZIcLUZQZrUnnIeXC169NIPwa7ipVwhE4IzkGwiQ3KSrD3RPpkFzF5/st3Kq/ci\nQFt6Mh6ZAgMBAAECggEACUbmF0rUqenpXn5t7oKgmCjfuqGw4XWHlR32MXSF6olv\n1qi0koxrgD/LAeYkO+rGr4Pyk/Scoa0+PJAUQxHF1iNNpx+xoSouKS16JgKMjK/N\nddNRI8bkWY+IDoLbNlByX3zgz7Wva8PN3htjafmPagMD233rq9rQ9KhetAjsEoUh\nQD742wfPx0n7ac/e0+hdFGHpMxfSGHPYPUP5W2kFJWRcv3rtkw2UMcASP3gfM598\n8eZ2QX9Sp6l+P93zTnq7qOsC25v2N44Q+oXHD5UDoEoKd5M6S+3zePCnLoVaiiGy\nJpIRGd2fpaP6w8iM12WRqNA6wunvUAkH4ria8VtcAQKBgQDbD9weWQUq/tT/GxQS\nyd54GlRfyC4k9YW4V88wHTS3k9duDCmLoRtEdLJE2wc/XGQU4j6IDGfk66X0v7vz\nGtikeJkMbKcd1ilvUzRFQEh80rBEwpMFPIlrv5cpa7HnZlC4DRpLOPanXwPZnCf+\n3l6xcbF4wT7o2i+FFOtaCnEUwQKBgQC55c/3bm3tAm1siz6Jzdd3VP58QbAC8y7s\n/NrI9cTCJlOAiIclq+a31800aNTvTCOvoeVRlHD2+I+jVjiIBksu8XzAkYooyf0m\ncPqFTYtFLr6yzCMlIqTZHY0SqNkvm6lrZQFojJHlxDYPIfdG2yLQgvcog5jqOXjV\nd8xjOxZH2QKBgQCjCYLB828tOMw9sWGXOjchHDd/sfTl/PWw5WmGXbZGivnjJZom\nGZm5sUCcjocuWQ0Dnf78Mn+AmQHCzpCLtodWoYsG/DbEtgfQmxRkFhvdCtG12zqg\nwxVj5AwU/9pAZp3c3aOcKKEqoES1SMtbnRTM69kyDmFL3FdRrOgc83iGAQKBgQCQ\n+OTPfIIjlIILZSf3RdzjxhfUhVGja0zMKoDgubGhC0yRb2ed/EooUxZH6f0tRT6L\nSIFStqXGJJ+37JSXl/jn+hGlB5ssJiHS6calUIzs/gBf5Yz+996BJ2eOBrmhRA7C\nnvmTNBTPj83szTtPObQT0h63rLEC8KEIMK3nMPw2OQKBgFDdlsjV9HwmpNbTXj8h\nl4BV6k2L0u7TntoLbJEPc8ew0Qkp7MId3WvufuxSqmCU78JHNtdUAZBZym9gAHPg\n0ZVEJcVTAb58VfW/yCSKLpGW/LiHogonDBUkzpopEK38YKYAI6mrDxVG7QMqWldA\nDMqU/hZoS4EpfoMhR89WnWsg\n-----END PRIVATE KEY-----\n",
  "client_email": "smarthome-3765e@appspot.gserviceaccount.com",
  "client_id": "107048827541788057262",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/smarthome-3765e%40appspot.gserviceaccount.com"
}
''');

const _SCOPES = [SpeechApi.CloudPlatformScope];

void testAPi() {
  clientViaServiceAccount(_credentials, _SCOPES).then((http_client) {
    var storage = StorageApi(http_client);
    storage.buckets.list('dart-on-cloud').then((buckets) {
      print('Received ${buckets.items.length} bucket names:');
      for (var file in buckets.items) {
        print(file.name);
      }
    });
  });
}