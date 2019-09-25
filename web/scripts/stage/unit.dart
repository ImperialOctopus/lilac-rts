import 'package:vector_math/vector_math.dart';
import '../engine/ai/instruction.dart';
import '../engine/ai/unit_ai.dart';
import '../engine/collision.dart';
import '../engine/helper.dart';
import '../renderer/shape.dart';
import 'game_object.dart';
import 'projectile.dart';
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

  Unit(this.position, this.team, {this.ai}) {
    velocity = Vector2.zero();
    targetVelocity = Vector2.zero();
    fireCooldown = 0;
    if (ai != null) {
      ai.unit = this;
    }
  }

  void update(double timeScale) {
    updateAI();
    updateMove(timeScale);
    updateFire(timeScale);
  }

  void updateMove(double timeScale) {
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
    stage.units.where((Unit u) => u != this).forEach((Unit unit) {
      reaction += Collision.unitReaction(this, unit);
    });
    return reaction;
  }

  void updateFire(double timeScale) {
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

  void destroy() {
    stage.removeUnit(this);
  }

  List<Shape> renderShapes() {
    if (team == Team.Friendly) {
      if (stage.game.input.unitSelect.selectedUnits.contains(this)) {
        return [Shape(ShapeType.Circle, radius, "#64b5f6")];
      } else {
        return [Shape(ShapeType.Circle, radius, "#2196f3")];
      }
    } else {
      return [Shape(ShapeType.Circle, radius, "#c2185b")];
    }
  }
}
