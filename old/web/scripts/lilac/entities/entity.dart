import 'dart:async';

import 'package:vector_math/vector_math.dart';

import '../collision.dart';
import '../time.dart';

enum EntityType { Unit, Projectile }
enum Team { Friendly, Enemy, Neutral }

class Entity {
  static List<Entity> all;

  StreamController entityDestroyed;
  EntityType entityType;
  Team team;

  Vector2 velocity;
  Vector2 position;
  int radius = 10;
  int mass;

  Entity(this.position, this.velocity, this.team) {
    all.add(this);
    entityDestroyed = new StreamController();
  }

  Circle circle() {
    return new Circle(position, radius);
  }

  void update() {
    move();
  }

  void move() {
    position += velocity * Time.multiplier;
    collision();
  }

  void collision() {}

  void destroy() {
    Entity.all.remove(this);
    entityDestroyed.add("Destroy");
  }

  // Target
  // Obstacle
  // Consumable
}
