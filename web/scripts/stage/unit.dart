import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';
import 'game_object.dart';
import 'stage.dart';

enum Team { Friendly, Enemy }

class Unit implements GameObject {
  double speed = 1;
  double acceleration = 0.2;
  double fireCooldownTime = 200;
  double projectileSpeed = 3;

  Team team;
  Vector2 position;
  Stage stage;

  double fireCooldown;

  Vector2 targetVelocity;
  Vector2 velocity;
  Vector2 moveTarget;
  Vector2 fireTarget;

  Unit(this.position, this.team, this.stage) {
    velocity = Vector2.zero();
    targetVelocity = Vector2.zero();
    fireCooldown = 0;
  }

  void update(double timeScale) {
    updateTarget();
    move(timeScale);
    updateFire(timeScale);
  }

  void updateTarget() {
    if (moveTarget != null) {
      Vector2 difference = moveTarget - position;
      targetVelocity = difference.normalized() * speed;
      if (position.distanceToSquared(moveTarget) < 100) {
        moveTarget = null;
        targetVelocity = Vector2.zero();
      }
    }
  }

  void move(double timeScale) {
    Vector2 diff = targetVelocity - velocity;
    velocity += clampVector(diff, acceleration * timeScale);
    velocity = clampVector(velocity, speed);
    position += velocity * timeScale;
    position.x = position.x.clamp(0, stage.width);
    position.y = position.y.clamp(0, stage.width);
  }

  void collision() {}

  void updateFire(double timeScale) {
    if (fireTarget != null && canFire()) {
      fireCooldown = fireCooldownTime;
      Vector2 velocity = (fireTarget - position).normalized() * projectileSpeed;
      stage.addProjectile(position, velocity, team);
      fireTarget = null;
    }
    if (fireCooldown > 0) {
      fireCooldown -= 1 * timeScale;
    }
  }

  void setMoveTarget(Vector2 position) {
    moveTarget = position;
  }

  void setFireTarget(Vector2 position) {
    fireTarget = position;
  }

  bool selected() {
    if (team != Team.Friendly) {
      return false;
    }
    return stage.game.input.unitSelect.selectedUnits.contains(this);
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

  List<Shape> renderShapes() {
    if (selected()) {
      return [Shape(ShapeType.Circle, 10, "#64b5f6")];
    } else if (team == Team.Friendly) {
      return [Shape(ShapeType.Circle, 10, "#2196f3")];
    } else {
      return [Shape(ShapeType.Circle, 10, "#c2185b")];
    }
  }
}
