import 'dart:io';

//  Function to start python script to interact with pins

void PinOn(int pinNumber) async {
  List<String> pythonCommends = List();
  pythonCommends.add('-c');
  pythonCommends.add('import RPi.GPIO as GPIO; pin = ' +
      pinNumber.toString() +
      '; GPIO.setmode(GPIO.BOARD); GPIO.setup(pin, GPIO.OUT); GPIO.output(pin, GPIO.HIGH); exit();');
  await Process.start('python', pythonCommends).then((process) async {});
}

void pinOff(int pinNumber) async {
  List<String> pythonCommends = List();
  pythonCommends.add('-c');
  pythonCommends.add('import RPi.GPIO as GPIO; pin = ' +
      pinNumber.toString() +
      '; GPIO.setmode(GPIO.BOARD); GPIO.setup(pin, GPIO.OUT); GPIO.output(pin, GPIO.LOW); exit();');
  await Process.start('python', pythonCommends).then((process) async {});
}
