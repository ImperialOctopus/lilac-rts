import 'package:vector_math/vector_math.dart';

import '../collision.dart';

enum EntityType { Unit, Projectile }

class Entity {
  Vector2 zero = new Vector2(0, 0);
  EntityType entityType;

  Vector2 velocity;
  Vector2 position;
  int radius = 10;
  int mass;

  Entity(this.position, this.velocity);

  Circle circle() {
    return new Circle(position, radius);
  }

  void update() {
    move();
  }

  void move() {
    position += velocity;
    collision();
  }

  void collision() {}

  // Target
  // Obstacle
  // Consumable
}
