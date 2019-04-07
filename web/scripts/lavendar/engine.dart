import 'dart:async';

import 'package:vector_math/vector_math.dart';

import 'entities/entity.dart';
import 'entities/projectile.dart';
import 'entities/unit.dart';

class Engine {
  List<Entity> entities;
  List<Unit> units;

  StreamController entityCreated;

  Engine() {
    units = new List<Unit>();
    entities = new List<Entity>();
    entityCreated = new StreamController<Entity>();
  }

  void start() {}

  void update() {
    for (var item in entities) {
      item.update();
    }
  }

  createUnit(Vector2 position, Team team) {
    Unit u = new Unit(position, team);
    entities.add(u);
    units.add(u);
    entityCreated.add(u);
  }

  createProjectile(Vector2 position, Vector2 velocity, Team team) {
    Projectile u = new Projectile(position, velocity, team);
    entities.add(u);
    entityCreated.add(u);
  }

  static Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }
}
