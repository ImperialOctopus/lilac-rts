import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../stage/game_object.dart';
import '../helper.dart';
import 'collider.dart';
import 'collider_circle.dart';

class ColliderLine implements Collider {
  GameObject parent;
  Vector2 offset;

  Vector2 direction;
  double length;

  ColliderLine(this.parent, this.direction, this.length, {this.offset}) {
    offset ??= Vector2.zero();
  }

  @override
  Vector2 get center {
    return parent.position + offset;
  }

  Vector2 get end {
    return center + (direction.scaled(length));
  }

  @override
  bool intersects(ColliderCircle collider) {
    if (collider == null) {
      return false;
    }
    Vector2 p = Helper.closestPointOnLine(collider.center, center, end);
    double distanceSquared = p.distanceToSquared(collider.center);
    return distanceSquared < pow(collider.radius, 2);
  }

  @override
  Vector2 reaction(ColliderCircle collider) {
    if (collider == null) {
      return Vector2.zero();
    }
    // intersects(collider)
    Vector2 p = Helper.closestPointOnLine(collider.center, center, end);
    double distanceSquared = p.distanceToSquared(collider.center);

    if (distanceSquared < pow(collider.radius, 2)) {
      return (collider.parent.position - p) *
          (1 / (distanceSquared / pow(collider.radius, 2))) *
          0.01;
    } else {
      return Vector2.zero();
    }
  }
}
