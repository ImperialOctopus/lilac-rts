import 'package:vector_math/vector_math.dart';

import '../lilac_game.dart';
import 'entity.dart';
import 'game_object.dart';
import 'obstacle.dart';
import 'projectile.dart';
import 'unit.dart';

class Stage {
  LilacGame game;

  int height;
  int width;
  String color;

  List<Unit> units;
  List<Projectile> projectiles;
  List<Entity> entities;
  List<Obstacle> obstacles;

  Vector2 cameraPosition = Vector2(0, 0);
  double cameraZoom = 1;

  Stage(this.height, this.width, this.color, this.game) {
    units = List<Unit>();
    projectiles = List<Projectile>();
    entities = List<Entity>();
    obstacles = List<Obstacle>();
  }

  List<GameObject> get gameObjects {
    // Everything with a render
    return [...units, ...projectiles, ...entities, ...obstacles];
  }

  void addUnit(Team team, Vector2 position) {
    units.add(Unit(position, team, this));
  }

  void addProjectile(Vector2 position, Vector2 velocity, Team team) {
    projectiles.add(Projectile(position, velocity, team));
  }

  void addEntity() {}
  void addObstacle() {}
}
