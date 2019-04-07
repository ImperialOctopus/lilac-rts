import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../collision.dart';
import '../engine.dart';
import '../target.dart';
import 'entity.dart';

enum Team { Friendly, Enemy }

class Unit extends Entity {
  double speed = 2;
  double acceleration = 0.5;
  Vector2 targetVelocity;

  Team team;
  Target moveTarget;

  Unit(Vector2 position, this.team) : super(position, Vector2.zero()) {
    targetVelocity = Vector2.zero();
    this.entityType = EntityType.Unit;
    moveTarget = new Target(TargetType.Move, Vector2.zero(), isSet: false);
  }

  void update() {
    updateMoveTarget();
    super.update();
  }

  void move() {
    Vector2 diff = targetVelocity - velocity;
    velocity += Engine.clampVector(diff, acceleration);
    velocity = Engine.clampVector(velocity, speed);
    super.move();
  }

  void collision() {
    for (Entity entity in Game.engine.entities) {
      if (entity != this) {
        if (Collision.circleBoundingBox(this.circle(), entity.circle())) {
          if (Collision.circleCircle(this.circle(), entity.circle())) {
            this.position -=
                Collision.resolveCollision(this.circle(), entity.circle()) /
                    2000;
          }
        }
      }
    }
  }

  void updateMoveTarget() {
    if (moveTarget.isSet) {
      Vector2 difference = moveTarget.position - position;
      targetVelocity = difference.normalized() * speed;
      if (position.distanceToSquared(moveTarget.position) < 100) {
        moveTarget.isSet = false;
        targetVelocity = Vector2.zero();
      }
    }
  }

  void setMoveTarget(Vector2 p) {
    moveTarget = new Target(TargetType.Move, p);
  }
}
