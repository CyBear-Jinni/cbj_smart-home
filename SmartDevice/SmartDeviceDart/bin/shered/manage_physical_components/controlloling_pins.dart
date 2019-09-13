import 'dart:io';

//  Function to start python script to interact with pins

void PinOn(int pinNumber) async {
  List<String> pythonCommends = List();
  pythonCommends.add('-c');
  pythonCommends.add(
'''
try:
   import RPi.GPIO as GPIO;
   pin = int(''' + pinNumber.toString() + ''');
   GPIO.setmode(GPIO.BOARD);
   GPIO.setup(pin, GPIO.OUT);
   GPIO.output(pin, GPIO.HIGH);
   exit();
   
except Exception as e:
   print("This is python exeption: " + str(e));
''');
  await Process.run('python', pythonCommends).then((ProcessResult results) {
    print(results.stdout);
  });
}

void pinOff(int pinNumber) async {
  List<String> pythonCommends = List();
  pythonCommends.add('-c');
  pythonCommends.add(
'''
try:
   import RPi.GPIO as GPIO;
   pin = int(''' + pinNumber.toString() + ''');
   GPIO.setmode(GPIO.BOARD);
   GPIO.setup(pin, GPIO.OUT);
   GPIO.output(pin, GPIO.LOW);
   exit();
   
except Exception as e:
   print("This is python exeption: " + str(e));
''');
  await Process.run('python', pythonCommends).then((ProcessResult results) {
    print(results.stdout);
  });
}
