import 'package:vector_math/vector_math.dart';

import '../../../engine/ai/unit_ai.dart';
import '../../../renderer/shapes/shape.dart';
import '../../../renderer/shapes/shape_circle.dart';
import '../projectiles/projectile.dart';
import '../projectiles/projectile_big.dart';
import 'unit.dart';

class UnitTank extends Unit {
  int radius = 30;
  int health = 5;
  double speed = 1.2;
  double acceleration = 0.2;
  double fireCooldownTime = 200;
  double projectileSpeed = 2;

  UnitTank(Vector2 position, Team team, {UnitAI ai})
      : super(position, team, ai: ai);

  @override
  Projectile createProjectile(Vector2 position, Vector2 velocity, Team team) {
    return ProjectileBig(position, velocity, team);
  }

  @override
  List<Shape> get renderShapes {
    if (team == Team.Friendly) {
      if (stage.selectedUnits.contains(this)) {
        return [
          ShapeCircle(this, radius, "#2286c3"),
          ShapeCircle(this, radius - 10, "#64b5f6")
        ];
      } else {
        return [
          ShapeCircle(this, radius, "#2286c3"),
          ShapeCircle(this, radius - 10, "#2196f3")
        ];
      }
    } else {
      return [
        ShapeCircle(this, radius, "#8c0032"),
        ShapeCircle(this, radius - 10, "#c2185b")
      ];
    }
  }
}
