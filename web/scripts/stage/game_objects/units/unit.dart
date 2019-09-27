import 'package:vector_math/vector_math.dart';

import '../../../engine/ai/instruction.dart';
import '../../../engine/ai/unit_ai.dart';
import '../../../engine/collision/collider.dart';
import '../../../engine/collision/collider_circle.dart';
import '../../../engine/helper.dart';
import '../../../renderer/shapes/shape.dart';
import '../../../renderer/shapes/shape_circle.dart';
import '../../stages/stage.dart';
import '../game_object.dart';
import '../projectiles/projectile.dart';

enum Team { Friendly, Enemy }

class Unit extends GameObject {
  Vector2 position;
  Stage stage;

  int radius = 20;
  double speed = 1;
  double acceleration = 0.2;
  double fireCooldownTime = 200;
  double projectileSpeed = 3;

  Team team;
  UnitAI ai;

  Vector2 velocity;
  Vector2 targetVelocity;
  Vector2 moveTarget;
  Vector2 fireTarget;
  double fireCooldown;

  Unit(this.position, this.team, {this.ai}) {
    velocity = Vector2.zero();
    targetVelocity = Vector2.zero();
    fireCooldown = 0;
    if (ai != null) {
      ai.unit = this;
    }
  }

  @override
  void start() {}

  @override
  void update() {
    updateAI();
    updateMove();
    updateFire();
  }

  void updateMove() {
    double timeScale = stage.time.multiplier;

    if (moveTarget != null) {
      Vector2 difference = moveTarget - position;
      targetVelocity = difference.normalized() * speed;
      if (position.distanceToSquared(moveTarget) < 100) {
        moveTarget = null;
        targetVelocity = Vector2.zero();
      }
    }
    velocity = Helper.clampVector(
        velocity +
            Helper.clampVector(
                targetVelocity - velocity, acceleration * timeScale),
        speed);
    velocity += resolveCollisions() * timeScale;
    position += velocity * timeScale;
  }

  Vector2 resolveCollisions() {
    Vector2 reaction = Vector2.zero();

    stage.units
        .where((GameObject gameObject) => gameObject != this)
        .forEach((GameObject gameObject) {
      reaction += gameObject.collider?.reaction(collider);
    });

    stage.entities.forEach((GameObject gameObject) {
      reaction += gameObject.collider?.reaction(collider);
    });

    stage.obstacles.forEach((GameObject gameObject) {
      reaction += gameObject.collider?.reaction(collider);
    });

    return reaction;
  }

  void updateFire() {
    double timeScale = stage.time.multiplier;

    if (fireTarget != null && fireCooldown <= 0) {
      fireCooldown = fireCooldownTime;
      Vector2 velocity = (fireTarget - position).normalized() * projectileSpeed;
      stage.addProjectile(Projectile(position, velocity, team));
      fireTarget = null;
    }
    if (fireCooldown > 0) {
      fireCooldown -= 1 * timeScale;
    }
  }

  void updateAI() {
    if (ai != null) {
      Instruction result = ai.update();
      if (result != null) {
        if (result.updateMoveTarget) {
          moveTarget = result.moveTarget;
        }
        if (result.updateFireTarget) {
          fireTarget = result.fireTarget;
        }
      }
    }
  }

  @override
  List<Shape> get renderShapes {
    if (team == Team.Friendly) {
      if (stage.selectedUnits.contains(this)) {
        return [ShapeCircle(this, radius, "#64b5f6")];
      } else {
        return [ShapeCircle(this, radius, "#2196f3")];
      }
    } else {
      return [ShapeCircle(this, radius, "#c2185b")];
    }
  }

  @override
  Collider get collider {
    return ColliderCircle(this, radius);
  }

  @override
  void destroy() {
    stage.removeUnit(this);
  }
}
