import 'package:vector_math/vector_math.dart';

class Instruction {
  Vector2 moveTarget;
  Vector2 fireTarget;
  bool fire;
  Instruction({this.moveTarget, this.fireTarget, this.fire});
}