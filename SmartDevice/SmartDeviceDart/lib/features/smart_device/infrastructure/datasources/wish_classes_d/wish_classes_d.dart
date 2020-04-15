import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/pin_setup_method_enum.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_gpio.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_phys.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_sys.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_gpio.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_phys.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_sys.dart';

class WishClassesD {
  Future<ProcessResult> turnOnLocalPhysicalPin(
      PinSetupMethodEnum pinSetupMethodEnum, String pinNumber) async {
    switch (pinSetupMethodEnum) {
      case PinSetupMethodEnum.wiringPiSetup:
        {
          return TurnPinOnWiringPiSetup().TurnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupGpio:
        {
          return TurnPinOnWiringPiSetupGpio().TurnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupPhys:
        {
          return TurnPinOnWiringPiSetupPhys().TurnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupSys:
        {
          return TurnPinOnWiringPiSetupSys().TurnThePinOn(pinNumber);
        }
      default:
        {
          return TurnPinOnWiringPiSetupGpio().TurnThePinOn(pinNumber);
        }
    }
  }

  Future<ProcessResult> turnOffLocalPhysicalPin(
      PinSetupMethodEnum pinSetupMethodEnum, String pinNumber) async {
    switch (pinSetupMethodEnum) {
      case PinSetupMethodEnum.wiringPiSetup:
        {
          return TurnPinOffWiringPiSetup().TurnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupGpio:
        {
          return TurnPinOffWiringPiSetupGpio().TurnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupPhys:
        {
          return TurnPinOffWiringPiSetupPhys().TurnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupSys:
        {
          return TurnPinOffWiringPiSetupSys().TurnThePinOff(pinNumber);
        }
      default:
        {
          return TurnPinOffWiringPiSetupGpio().TurnThePinOff(pinNumber);
        }
    }
  }
}
