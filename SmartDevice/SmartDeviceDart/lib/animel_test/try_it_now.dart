import 'package:SmartDeviceDart/animel_test/abstract_animle.dart';

class TryItNow {
  final AnimalAbstract _animalAbstract;

  TryItNow(this._animalAbstract);

  int getLegs() {
    return _animalAbstract.numberOfLegs();
  }
}
