import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';

import 'abstract_animle.dart';

@RegisterAs(AnimalAbstract, env: Env.dev_pc)
@injectable
class CowAnimal extends AnimalAbstract {
  CowAnimal() {
    print("Bip Bip I'm a cow, I said Bip Bip I'm a cow");
  }

  @override
  int numberOfLegs() {
//    print("Cow animle 4");
    return 4;
  }

  @override
  String name() {
    return "sds";
  }
}
