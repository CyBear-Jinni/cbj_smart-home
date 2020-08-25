import 'package:Assistant/core/shared_variables.dart';
import 'package:Assistant/features/hot_key_word/application/usecases/hot_keyword_u/hot_keyword_u.dart';

void main(List<String> arguments) {
  try {
    SharedVariables(arguments[0]);
  } catch (error) {
    print('Path/argument 1 is not specified');
    print('error: ' + error.toString());
  }

  HotKeywordU hotKeywordU = HotKeywordU();

  hotKeywordU.startListeningToVoiceCommandForever();
}
