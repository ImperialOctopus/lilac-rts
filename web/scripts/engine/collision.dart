import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../stage/unit.dart';

class Collision {
  static Vector2 unitToUnit(Unit us, Unit them) {
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
}
