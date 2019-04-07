import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../target.dart';
import 'entity.dart';

enum Team { Friendly, Enemy }

class Unit extends Entity {
  double speed = 2;

  Team team;
  Target moveTarget;

  Unit(Vector2 position, this.team) : super(position) {
    this.entityType = EntityType.Unit;
    moveTarget = new Target();
    moveTarget.position = new Vector2(100, 100);
    moveTarget.isSet = true;
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
      velocity = difference;
      velocity.normalize();
    }
  }
}
