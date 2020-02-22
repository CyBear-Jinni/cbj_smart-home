import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

import 'abstract_animle.dart';

@RegisterAs(AnimalAbstract, env: Env.prod)
@injectable
class LemAnimal extends AnimalAbstract {
  LemAnimal() {
    print("Bip Bip I'm a lem, I said Bip Bip I'm a lem");
  }

  @override
  int numberOfLegs() => 1;

  @override
  String name() => "lem";
}
