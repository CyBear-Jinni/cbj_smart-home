// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:SmartDeviceDart/animel_test/abstract_animle.dart';
import 'package:SmartDeviceDart/animel_test/american_cow.dart';
import 'package:SmartDeviceDart/animel_test/cow.dart';
import 'package:SmartDeviceDart/animel_test/fake_cow.dart';
import 'package:SmartDeviceDart/animel_test/lem.dart';
import 'package:SmartDeviceDart/animel_test/mock_cow_animal.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/voice_command_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/button_object_local.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/getting_signals_from_pins/button_object_local_fake.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/controlloling_pins_local.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/microphone/microphone_voice_command.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/repositories/VoiceCommand.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<AmericanCowAnimal>(() => AmericanCowAnimal());
  if (environment == 'dev_pc') {
    _registerDev_pcDependencies(g);
  }
  if (environment == 'prod') {
    _registerProdDependencies(g);
  }
  if (environment == 'test') {
    _registerTestDependencies(g);
  }
  if (environment == 'dev_pi') {
    _registerDev_piDependencies(g);
  }
}

void _registerDev_pcDependencies(GetIt g) {
  g.registerFactory<AnimalAbstract>(() => CowAnimal());
  g.registerFactory<VoiceCommandAbstract>(() => VoiceCommand());
  g.registerFactory<MicrophoneVoiceCommandAbstract>(
      () => MicrophoneVoiceCommandPc());
  g.registerFactory<TurnPinOnOffAbstract>(() => TurnPinOnOff());
  g.registerFactory<ButtonObjectLocalAbstract>(() => ButtonObjectLocal());
}

void _registerProdDependencies(GetIt g) {
  g.registerFactory<AnimalAbstract>(() => LemAnimal());
}

void _registerTestDependencies(GetIt g) {
  g.registerFactory<AnimalAbstract>(() => MockCowAnimal());
  g.registerFactory<AnimalAbstract>(() => fakeCowAnimal());
  g.registerFactory<ButtonObjectLocalAbstract>(() => ButtonObjectLocalFake());
}

void _registerDev_piDependencies(GetIt g) {
  g.registerFactory<MicrophoneVoiceCommandAbstract>(
      () => MicrophoneVoiceCommand());
}
