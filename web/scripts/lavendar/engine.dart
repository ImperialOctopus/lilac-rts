import 'dart:async';

import 'package:vector_math/vector_math.dart';

import 'ai/ai.dart';
import 'entities/entity.dart';
import 'entities/projectile.dart';
import 'entities/unit.dart';
import 'time.dart';

class Engine {
  Time time;
  AI ai;

  List<Unit> units;
  StreamController entityCreated;

  Engine() {
    Entity.all = new List<Entity>();
    units = new List<Unit>();
    entityCreated = new StreamController<Entity>();
    time = new Time();
    ai = new AI(units);
  }

  void start() {}

  void update() {
    for (var item in Entity.all) {
      item.update();
    }
    ai.update();
  }

  createUnit(Vector2 position, Team team) {
    Unit u = new Unit(position, team);
    units.add(u);
    entityCreated.add(u);
  }

  createProjectile(Vector2 position, Vector2 velocity, Team team) {
    Projectile u = new Projectile(position, velocity, team);
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
