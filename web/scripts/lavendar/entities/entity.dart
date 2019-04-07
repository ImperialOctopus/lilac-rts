import 'dart:async';

import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../collision.dart';

enum EntityType { Unit, Projectile }
enum Team { Friendly, Enemy }

class Entity {
  StreamController entityDestroyed;
  EntityType entityType;

  Vector2 velocity;
  Vector2 position;
  int radius = 10;
  int mass;

  Entity(this.position, this.velocity) {
    entityDestroyed = new StreamController();
  }

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

  void destroy() {
    Game.engine.entities.remove(this);
    entityDestroyed.add("Destroy");
  }

  // Target
  // Obstacle
  // Consumable
}
