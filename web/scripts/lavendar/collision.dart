import 'dart:math';

import 'package:vector_math/vector_math.dart';

class Collision {
  static bool circleBoundingBox(Circle a, Circle b) {
    return (a.x + a.radius + b.radius > b.x &&
        a.x < b.x + a.radius + b.radius &&
        a.y + a.radius + b.radius > b.y &&
        a.y < b.y + a.radius + b.radius);
  }

  static bool circleCircle(Circle a, Circle b) {
    int r = a.radius;
    r *= r;
    return r < pow((a.x + b.x), 2) + pow((a.y + b.y), 2);
  }

  static Vector2 collisionPoint(Circle a, Circle b) {
    double collisionPointX =
        ((a.x * b.radius) + (b.x * a.radius)) / (a.radius + b.radius);
    double collisionPointY =
        ((a.y * b.radius) + (b.y * a.radius)) / (a.radius + b.radius);
    return new Vector2(collisionPointX, collisionPointY);
  }

  static bool circlePoint(Circle a, Vector2 p) {
    return a.position.distanceToSquared(p) < a.radius * a.radius;
  }

  static Vector2 resolveCollision(Circle a, Circle b) {
    Vector2 direction = b.position - a.position;
    direction.scale(-1);
    double penetration = a.position.distanceToSquared(b.position) -
        pow((a.radius + b.radius), 2);
    direction *= penetration;
    return direction;
  }
}

class Circle {
  Vector2 position;
  int radius;

  get x {
    return position.x;
  }

  get y {
    return position.y;
  }

  Circle(this.position, this.radius);
}
