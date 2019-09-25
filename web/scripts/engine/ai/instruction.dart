import 'package:vector_math/vector_math.dart';

class Instruction {
  bool updateMoveTarget;
  Vector2 moveTarget;

  bool updateFireTarget;
  Vector2 fireTarget;

  Instruction(
      {this.updateMoveTarget,
      this.moveTarget,
      this.updateFireTarget,
      this.fireTarget});
}
