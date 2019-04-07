import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../target.dart';
import 'entity.dart';

enum Team { Friendly, Enemy }

class Unit extends Entity {
  double speed = 2;

  Team team;
  Target moveTarget;

  Unit(Vector2 position, this.team) : super(position) {
    this.entityType = EntityType.Unit;
    moveTarget = new Target(TargetType.Move, Vector2.zero(), isSet: false);
  }

  void update() {
    updateMoveTarget();
    super.update();
  }

  void updateMoveTarget() {
    if (moveTarget.isSet) {
      if (position.distanceToSquared(moveTarget.position) < 25) {
        moveTarget.isSet = false;
        velocity = Vector2.zero();
      }
    }
    if (moveTarget.isSet) {
      Vector2 difference = moveTarget.position - position;
      difference.normalize();
      difference *= speed * Game.deltaTime;
      velocity = difference;
    }
  }

  void setMoveTarget(Vector2 p) {
    moveTarget = new Target(TargetType.Move, p);
  }
}
