import '../lib/director.dart';


main(List<String> arguments) async {
  print("helllow");
  String snapPath = arguments[0];
  Director director = Director(snapPath);
}
