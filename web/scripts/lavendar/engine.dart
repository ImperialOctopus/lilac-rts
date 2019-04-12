import 'dart:async';

import 'package:vector_math/vector_math.dart';

import 'ai/ai.dart';
import 'entities/entity.dart';
import 'entities/projectile.dart';
import 'entities/unit.dart';
import 'time.dart';

enum LavendarEvent { UnitCreated }

class Engine {
  Time time;
  AI ai;

  StreamController streamController;

  Engine() {
    Entity.all = new List<Entity>();
    Unit.all = new List<Unit>();
    Projectile.all = new List<Projectile>();
    streamController = new StreamController<Entity>();
    time = new Time();
    ai = new AI();
  }

  void update() {
    for (var e in Entity.all) {
      e.update();
    }
    ai.update();
  }

  createUnit(Vector2 position, Team team) {
    Unit u = new Unit(position, team);
    streamController.add(u);
  }

  createProjectile(Vector2 position, Vector2 velocity, Team team) {
    Projectile u = new Projectile(position, velocity, team);
    streamController.add(u);
  }

  static Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }
}
