import 'package:SmartDeviceDart/animel_test/abstract_animle.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@RegisterAs(AnimalAbstract, env: Env.test)
@injectable
class fakeCowAnimal extends Fake implements AnimalAbstract {
  @override
  int numberOfLegs() {
    // TODO: implement numberOfLegs
    return 4;
  }
}
