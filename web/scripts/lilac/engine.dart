import 'dart:async';

import 'package:vector_math/vector_math.dart';
import 'ai/ai.dart';
import 'entities/entity.dart';
import 'entities/projectile.dart';
import 'entities/unit.dart';

class Engine {
  static get allEntities {
    return Entity.all;
  }

  static AI ai;

  static int stageHeight = 1000;
  static int stageWidth = 1000;

  static void load() {
    Entity.all = new List<Entity>();
    Unit.all = new List<Unit>();
    Projectile.all = new List<Projectile>();

    ai = new AI();
  }

  static void start() {
    Timer.periodic(Duration(milliseconds: 20), Engine.update);
  }

  static void update(Timer t) {
    for (Entity e in Entity.all) {
      e.update();
    }
    ai.update();
  }

  static createUnit(Vector2 position, Team team) {
    new Unit(position, team);
  }

  static createProjectile(Vector2 position, Vector2 velocity, Team team) {
    new Projectile(position, velocity, team);
  }
}
