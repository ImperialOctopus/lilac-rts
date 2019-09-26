import 'package:vector_math/vector_math.dart';

import '../engine/collision/collider.dart';
import '../engine/collision/collider_circle.dart';
import '../renderer/shapes/shape.dart';
import '../renderer/shapes/shape_circle.dart';
import 'entity.dart';
import 'game_object.dart';
import 'obstacles/obstacle.dart';
import 'stages/stage.dart';
import 'units/unit.dart';

class Projectile implements GameObject {
  Vector2 position;
  Vector2 velocity;
  Team team;
  Stage stage;

  int radius = 5;

  Projectile(this.position, this.velocity, this.team);

  @override
  void update(double timeScale) {
    resolveCollisions();

    position += velocity * timeScale;
  }

  void resolveCollisions() {
    for (Unit unit in stage.units) {
      if (unit.team != team && collider().intersects(unit.collider())) {
        unit.destroy();
        this.destroy();
      }
    }

    for (Entity entity in stage.entities) {
      if (entity.collider() != null) {
        if (entity.collider().intersects(collider())) {
          this.destroy();
        }
      }
    }

    for (Obstacle obstacle in stage.obstacles) {
      if (obstacle.collider() != null) {
        if (obstacle.collider().intersects(collider())) {
          this.destroy();
        }
      }
    }

    for (Projectile projectile in stage.projectiles) {
      if (projectile == this) {
        continue;
      }
      if (collider().intersects(projectile.collider())) {
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
  List<Shape> renderShapes() {
    if (team == Team.Friendly) {
      return [ShapeCircle(this, radius, "#000000")];
    } else {
      return [ShapeCircle(this, radius, "#880e4f")];
    }
  }

  @override
  Collider collider() {
    return ColliderCircle(this, radius);
  }
}
