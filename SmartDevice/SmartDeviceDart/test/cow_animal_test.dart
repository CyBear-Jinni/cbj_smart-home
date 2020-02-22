import 'package:SmartDeviceDart/animel_test/abstract_animle.dart';
import 'package:SmartDeviceDart/animel_test/mock_cow_animal.dart';
import 'package:SmartDeviceDart/injection.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  AnimalAbstract mockCowAnimal;

  setUpAll(() {
    configureInjection(Env.test);
  });

  setUp(() {
    // Create mock object.
    mockCowAnimal = MockCowAnimal();
  });

  test("Cow legs", () async {
    //  Arrange

    //  Act
    when(mockCowAnimal.numberOfLegs()).thenReturn(4);
    print("Number of legs to cow" + mockCowAnimal.numberOfLegs().toString());
    //  Assert
    verify(mockCowAnimal.numberOfLegs()).called(2);
//    expect(mockCowAnimal.numberOfLegs(), 4);
  });

  test("Cow legs fakeCowAnimal ", () async {
    //  Arrange

    //  Act
    when(mockCowAnimal.numberOfLegs()).thenReturn(4);
    print("Number of legs to cow" + mockCowAnimal.numberOfLegs().toString());
    //  Assert
    verify(mockCowAnimal.numberOfLegs()).called(2);
//    expect(mockCowAnimal.numberOfLegs(), 4);
  });
}
