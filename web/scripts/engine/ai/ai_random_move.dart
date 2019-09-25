import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../stage/unit.dart';
import 'instruction.dart';
import 'unit_ai.dart';

class AIRandomMove implements UnitAI {
  Unit unit;

  Instruction update() {
    Random random = Random();
    Vector2 move;
    Vector2 fire;
    if (unit.moveTarget == null) {
      move = Vector2(random.nextInt(unit.stage.width).toDouble(),
          random.nextInt(unit.stage.height).toDouble());
    }
    if (unit.fireTarget == null) {
      fire = Vector2(random.nextInt(unit.stage.width).toDouble(),
          random.nextInt(unit.stage.height).toDouble());
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
