import 'package:vector_math/vector_math.dart';

import '../../stage/unit.dart';
import 'instruction.dart';
import 'unit_ai.dart';

class AIRandomMove implements UnitAI {
  Unit unit;

  Instruction update() {
    Vector2 move;
    Vector2 fire;
    if (unit.moveTarget == null) {
      move = unit.stage.randomPosition();
    }
    if (unit.fireTarget == null) {
      fire = unit.stage.randomPosition();
    }
    if (move == null && fire == null) {
      return null;
    } else {
      return Instruction(
          updateMoveTarget: move != null,
          updateFireTarget: fire != null,
          moveTarget: move,
          fireTarget: fire);
    }
  }
}
