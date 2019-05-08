import 'package:vector_math/vector_math.dart';

import '../collision.dart';
import '../engine.dart';
import '../target.dart';
import '../time.dart';
import 'entity.dart';

class Unit extends Entity {
  static List<Unit> all;

  double speed = 1;
  double acceleration = 0.2;
  double fireCooldownTime = 200;
  double projectileSpeed = 3;

  double fireCooldown;

  Vector2 targetVelocity;
  Target moveTarget;
  Target fireTarget;

  Unit(Vector2 position, Team team) : super(position, Vector2.zero(), team) {
    all.add(this);

    targetVelocity = Vector2.zero();
    fireCooldown = 0;
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
    velocity += clampVector(diff, acceleration * Time.multiplier);
    velocity = clampVector(velocity, speed);
    super.move();
    position.x = position.x.clamp(0, Engine.stageWidth);
    position.y = position.y.clamp(0, Engine.stageHeight);
  }

  void destroy() {
    Unit.all.remove(this);
    super.destroy();
  }

  void collision() {
    List<Entity> collisionSet = Unit.all;
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
      Vector2 v =
          (fireTarget.position - position).normalized() * projectileSpeed;
      Engine.createProjectile(position, v, team);
    }
    if (fireCooldown > 0) {
      fireCooldown -= 1 * Time.multiplier;
    }
  }

  void setMoveTarget(Vector2 position) {
    moveTarget = new Target(TargetType.Move, position);
  }

  void setFireTarget(Vector2 position) {
    if (canFire()) {
      fireTarget = new Target(TargetType.Fire, position);
    }
  }

  bool canFire() {
    return (fireCooldown <= 0);
  }

  Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }
}
