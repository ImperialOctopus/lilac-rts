import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../lilac_game.dart';
import '../entity.dart';
import '../game_object.dart';
import '../obstacles/obstacle.dart';
import '../projectile.dart';
import '../units/unit.dart';

class Stage {
  LilacGame game;

  int height;
  int width;
  String colour;

  Set<Unit> units;
  Set<Projectile> projectiles;
  Set<Entity> entities;
  Set<Obstacle> obstacles;

  Vector2 cameraPosition = Vector2(0, 0);
  double cameraZoom = 1;

  Vector2 get cameraOffset {
    return cameraPosition.scaled(-1);
  }

  Stage(this.game) {
    units = Set<Unit>();
    projectiles = Set<Projectile>();
    entities = Set<Entity>();
    obstacles = Set<Obstacle>();
  }

  List<GameObject> get gameObjects {
    return [...units, ...projectiles, ...entities, ...obstacles];
  }

  Vector2 randomPosition() {
    Random random = Random();
    return Vector2(
        random.nextInt(width).toDouble(), random.nextInt(height).toDouble());
  }

  void start() {}

  void addUnit(Unit unit) {
    unit.stage = this;
    units.add(unit);
  }

  void addProjectile(Projectile projectile) {
    projectile.stage = this;
    projectiles.add(projectile);
  }

  void addEntity(Entity entity) {
    entity.stage = this;
    entities.add(entity);
  }

  void addObstacle(Obstacle obstacle) {
    obstacle.stage = this;
    obstacles.add(obstacle);
  }

  void removeUnit(Unit unit) {
    units.remove(unit);
  }

  void removeProjectile(Projectile projectile) {
    projectiles.remove(projectile);
  }

  void removeEntity(Entity entity) {
    entities.remove(entity);
  }

  void removeObstacle(Obstacle obstacle) {
    obstacles.remove(obstacle);
  }
}
