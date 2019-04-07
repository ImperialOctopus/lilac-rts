import 'dart:math';

class Collision {
  static bool circleCircle(Circle a, Circle b) {
    int r = a.radius;
    r *= r;
    return r < pow((a.x + b.x), 2) + pow((a.y + b.y), 2);
  }
}

class Circle {
  double x;
  double y;
  int radius;
  Circle(this.x, this.y, this.radius);
}
