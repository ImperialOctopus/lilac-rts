import 'package:vector_math/vector_math.dart';

import '../engine/collision.dart';
import '../renderer/shapes/shape.dart';
import '../renderer/shapes/shape_circle.dart';
import 'game_object.dart';
import 'stage.dart';
import 'units/unit.dart';

class Projectile implements GameObject {
  Vector2 position;
  Vector2 velocity;
  Team team;
  Stage stage;

  int radius = 5;

  Projectile(this.position, this.velocity, this.team);

  void update(double timeScale) {
    stage.units.forEach((Unit unit) {
      if (unit.team != team && Collision.projectileToUnit(this, unit)) {
        unit.destroy();
        this.destroy();
      }
    });
    stage.projectiles
        .where((Projectile p) => p != this)
        .forEach((Projectile projectile) {
      if (projectile.team != team &&
          Collision.projectileToProjectile(this, projectile)) {
        projectile.destroy();
        this.destroy();
      }
    });

    position += velocity * timeScale;
  }

  List<Shape> renderShapes() {
    if (team == Team.Friendly) {
      return [ShapeCircle(radius, "#000000")];
    } else {
      return [ShapeCircle(radius, "#880e4f")];
    }
  }

  void destroy() {
    stage.removeProjectile(this);
  }
}