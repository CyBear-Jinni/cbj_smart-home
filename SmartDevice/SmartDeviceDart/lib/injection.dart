import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;



abstract class Env {
  static const test = 'test';
  static const dev_pc = 'dev_pc';
  static const dev_pi = 'dev_pi';
  static const prod = 'prod';
}

class Configuration {
  static Env environment;

  Configuration(environment);
}
