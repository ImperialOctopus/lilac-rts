import 'package:vector_math/vector_math.dart';

import '../../../engine/collision/collider.dart';
import '../../../engine/collision/collider_circle.dart';
import '../../../renderer/shapes/shape.dart';
import '../../../renderer/shapes/shape_circle.dart';
import '../entities/entity.dart';
import '../obstacles/obstacle.dart';
import '../units/unit.dart';
import 'projectile.dart';

class ProjectileBig extends Projectile {
  int radius = 10;
  int damage = 3;

  ProjectileBig(Vector2 position, Vector2 velocity, Team team)
      : super(position, velocity, team);

  @override
  void resolveCollisions() {
    for (Unit unit in stage.units) {
      if (unit.team != team && unit.collider.intersectsCircle(collider)) {
        unit.damage(damage);
        this.destroy();
      }
    }

    for (Entity entity in stage.entities) {
      if (entity.collider != null) {
        if (entity.collider.intersectsCircle(collider)) {
          this.destroy();
        }
      }
    }

    for (Obstacle obstacle in stage.obstacles) {
      if (obstacle.collider != null) {
        if (obstacle.collider.intersectsCircle(collider)) {
          this.destroy();
        }
      }
    }

    for (Projectile projectile in stage.projectiles) {
      if (projectile == this) {
        continue;
      }
      if (projectile.collider.intersectsCircle(collider)) {
        projectile.destroy();
        this.destroy();
      }
    }
  }

  @override
  void destroy() {
    stage.removeProjectile(this);
  }

  @override
  List<Shape> get renderShapes {
    if (team == Team.Friendly) {
      return [ShapeCircle(this, radius, "#000000")];
    } else {
      return [ShapeCircle(this, radius, "#880e4f")];
    }
  }

  @override
  Collider get collider {
    return ColliderCircle(this, radius);
  }
}
