// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/device_pin_manager.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/controlloling_pins_local.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  //Register dev_pi Dependencies --------
  if (environment == 'dev_pi') {
    g.registerFactory<DevicePinListManagerAbstract>(
        () => DevicePinListManager());
    g.registerFactory<TurnPinOnOffAbstract>(() => TurnPinOnOff());
  }

  //Register dev_pc Dependencies --------
  if (environment == 'dev_pc') {
    g.registerFactory<DevicePinListManagerAbstract>(
        () => DevicePinListManagerPC());
    g.registerFactory<TurnPinOnOffAbstract>(() => TurnPinOnOffPc());
  }
}
