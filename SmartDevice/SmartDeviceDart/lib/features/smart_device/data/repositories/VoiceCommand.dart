import 'package:SmartDeviceDart/features/smart_device/data/datasources/microphone/microphone_voice_command.dart';
import 'package:SmartDeviceDart/features/smart_device/domain/repositories/voice_command_abstract.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(VoiceCommandAbstract, env: Env.dev_pc)
@RegisterAs(VoiceCommandAbstract, env: Env.prod)
@injectable
class VoiceCommand extends VoiceCommandAbstract {
  MicrophoneVoiceCommandAbstract microphoneVoiceCommand;

  VoiceCommand() {
    microphoneVoiceCommand = getIt<MicrophoneVoiceCommandAbstract>();
  }

  @override
  Future<bool> listenToActivateKeyWord() async {
    return await microphoneVoiceCommand.listenToVoiceCommand();
  }
}
