import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../collision.dart';
import '../engine.dart';
import '../target.dart';
import 'entity.dart';

class Unit extends Entity {
  double speed = 2;
  double acceleration = 0.5;
  int fireCooldownTime = 50;
  int fireCooldown = 0;

  Vector2 targetVelocity;
  Team team;
  Target moveTarget;
  Target fireTarget;

  Unit(Vector2 position, this.team) : super(position, Vector2.zero()) {
    targetVelocity = Vector2.zero();
    this.entityType = EntityType.Unit;
    moveTarget = new Target(TargetType.Move, Vector2.zero(), isSet: false);
    fireTarget = new Target(TargetType.Fire, Vector2.zero(), isSet: false);
  }

  void update() {
    updateMove();
    updateFire();
    super.update();
  }

  void move() {
    Vector2 diff = targetVelocity - velocity;
    velocity += Engine.clampVector(diff, acceleration);
    velocity = Engine.clampVector(velocity, speed);
    super.move();
    position.x = position.x.clamp(0, stageWidth);
    position.y = position.y.clamp(0, stageHeight);
  }

  void destroy() {
    Game.engine.units.remove(this);
    super.destroy();
  }

  void collision() {
    List<Entity> collisionSet = Game.engine.units;
    for (Entity entity in collisionSet) {
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

  void projectileHit() {
    destroy();
  }

  void updateMove() {
    if (moveTarget.isSet) {
      Vector2 difference = moveTarget.position - position;
      targetVelocity = difference.normalized() * speed;
      if (position.distanceToSquared(moveTarget.position) < 100) {
        moveTarget.isSet = false;
        targetVelocity = Vector2.zero();
      }
    }
  }

  void updateFire() {
    if (fireTarget.isSet && canFire()) {
      fireCooldown = fireCooldownTime;
      fireTarget.isSet = false;
      Vector2 v = (fireTarget.position - position).normalized() * 5;
      Game.engine.createProjectile(position, v, team);
    }
    if (fireCooldown > 0) {
      fireCooldown -= 1;
    }
  }

  void setMoveTarget(Vector2 position) {
    moveTarget = new Target(TargetType.Move, position);
  }

  void setFireTarget(Vector2 position) {
    fireTarget = new Target(TargetType.Fire, position);
  }

  bool canFire() {
    return (fireCooldown == 0);
  }
}
