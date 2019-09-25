import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../stage/projectile.dart';
import '../stage/unit.dart';

class Collision {
  static Vector2 unitReaction(Unit us, Unit them) {
    if (us.position.distanceToSquared(them.position) <
        pow(us.radius + them.radius, 2)) {
      return (us.position - them.position) *
          (1 /
              (us.position.distanceToSquared(them.position) /
                  pow(us.radius + them.radius, 2))) *
          0.01;
    } else {
      return Vector2.zero();
    }
  }
  static bool projectileToUnit(Projectile projectile, Unit unit) {
    return (projectile.position.distanceToSquared(unit.position) <=
        pow(unit.radius + projectile.radius, 2));
  }

  static bool projectileToProjectile(Projectile us, Projectile them) {
    return (us.position.distanceToSquared(them.position) <=
        pow(us.radius + them.radius, 2));
  }
}
