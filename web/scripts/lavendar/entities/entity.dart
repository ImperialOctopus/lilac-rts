import 'package:vector_math/vector_math.dart';

class Entity {
  int mass;
  Vector2 velocity;
  Vector2 position;

  int size;

  Entity(this.position) {}

  void collision() {}
  void update() {}

  // Target
  // Obstacle
  // Consumable
  // Projectile
}
