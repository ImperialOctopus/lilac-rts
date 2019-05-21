import 'package:vector_math/vector_math.dart';

enum TargetType { Move, Fire }

class Target {
  TargetType targetType;
  bool isSet;
  Vector2 position;

  Target(this.targetType, this.position, {this.isSet = true});
}
