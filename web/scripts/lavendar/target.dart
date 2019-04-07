import 'package:vector_math/vector_math.dart';

enum TargetType { Move, Fire }

class Target {
  Target() {
    isSet = false;
    position = Vector2.zero();
  }
  bool isSet;
  Vector2 position;
}
