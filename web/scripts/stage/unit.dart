import 'package:vector_math/vector_math.dart';
import '../engine/ai/unit_ai.dart';
import '../engine/collision.dart';
import '../engine/helper.dart';
import '../renderer/shape.dart';
import 'game_object.dart';
import 'stage.dart';

enum Team { Friendly, Enemy }

class Unit implements GameObject {
  int radius = 20;

  double speed = 1;
  double acceleration = 0.2;
  double fireCooldownTime = 200;
  double projectileSpeed = 3;

  Team team;
  Vector2 position;
  Stage stage;
  UnitAI ai;

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
    move(timeScale);
    updateFire(timeScale);
  }

  void move(double timeScale) {
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
    Vector2 normal = Vector2.zero();
    stage.units.where((Unit u) => u != this).forEach((Unit unit) {
      normal += Collision.unitToUnit(this, unit);
    });
    return normal;
  }

  void updateFire(double timeScale) {
    if (fireTarget != null && fireCooldown <= 0) {
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

  List<Shape> renderShapes() {
    if (selected()) {
      return [Shape(ShapeType.Circle, radius, "#64b5f6")];
    } else if (team == Team.Friendly) {
      return [Shape(ShapeType.Circle, radius, "#2196f3")];
    } else {
      return [Shape(ShapeType.Circle, radius, "#c2185b")];
    }
  }
}
