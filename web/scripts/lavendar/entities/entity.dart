import 'package:vector_math/vector_math.dart';

enum EntityType { Unit }

class Entity {
  EntityType entityType;
  Vector2 velocity;
  Vector2 position;
  int mass;
  int radius;

  Entity(this.position) {
    velocity = Vector2.zero();
  }

  void update() {
    move();
  }

  void move() {
    position += velocity;
  }

  void collision() {}

  // Target
  // Obstacle
  // Consumable
  // Projectile
}
