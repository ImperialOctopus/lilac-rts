import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../stage/game_object.dart';
import 'collider.dart';

class ColliderCircle implements Collider {
  GameObject parent;
  Vector2 offset;

  int radius;

  ColliderCircle(this.parent, this.radius, {this.offset}) {
    offset ??= Vector2.zero();
  }

  @override
  Vector2 get center {
    return parent.position + offset;
  }

  @override
  bool intersectsCircle(ColliderCircle collider) {
    if (collider == null) {
      return false;
    }
    return (center.distanceToSquared(collider.parent.position) <=
        pow(radius + collider.radius, 2));
  }

  @override
  Vector2 reaction(ColliderCircle collider) {
    if (collider == null) {
      return Vector2.zero();
    }
    if (intersectsCircle(collider)) {
      return (collider.parent.position - center) *
          (1 /
              (center.distanceToSquared(collider.parent.position) /
                  pow(radius + collider.radius, 2))) *
          0.01;
    } else {
      return Vector2.zero();
    }
  }
}
