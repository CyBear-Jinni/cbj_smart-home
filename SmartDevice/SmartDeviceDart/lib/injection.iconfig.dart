// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:SmartDeviceDart/animel_test/american_cow.dart';
import 'package:SmartDeviceDart/animel_test/cow.dart';
import 'package:SmartDeviceDart/animel_test/abstract_animle.dart';
import 'package:SmartDeviceDart/animel_test/lem.dart';
import 'package:SmartDeviceDart/animel_test/mock_cow_animal.dart';
import 'package:SmartDeviceDart/animel_test/fake_cow.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/button_object_local_fake.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/button_object_local_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/button_object_local.dart';
import 'package:SmartDeviceDart/features/smart_device/data/repositories/VoiceCommand.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/voice_command_abstract.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/microphone/microphone_voice_command.dart';
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
  g.registerFactory<ButtonObjectLocalAbstract>(() => ButtonObjectLocal());
  g.registerFactory<VoiceCommandAbstract>(() => VoiceCommand());
  g.registerFactory<MicrophoneVoiceCommandAbstract>(
      () => MicrophoneVoiceCommandPc());
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
