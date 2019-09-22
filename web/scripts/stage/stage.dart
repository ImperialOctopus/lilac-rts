import 'entity.dart';
import 'game-object.dart';
import 'obstacle.dart';
import 'projectile.dart';
import 'unit.dart';

class Stage {
  int height;
  int width;
  String color;

  List<Unit> units;
  List<Projectile> projectiles;
  List<Entity> entities;
  List<Obstacle> obstacles;

  Stage(this.height, this.width, this.color);

  List<GameObject> get gameObjects {
    // Everything with a render
    return [...units, ...projectiles, ...entities, ...obstacles];
  }

  void addUnit() {}
  void addProjectile(position, velocity, team) {
    projectiles.add(Projectile(position, velocity, team));
  }

  void addEntity() {}
  void addObstacle() {}
}
