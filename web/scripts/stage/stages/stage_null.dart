import 'dart:html';

import '../entity.dart';
import '../obstacles/obstacle.dart';
import '../projectile.dart';
import '../units/unit.dart';
import 'stage.dart';

class StageNull extends Stage {
  StageNull(game) : super(game);

  @override
  void start() {}

  @override
  void mouseDown(MouseEvent e) {}

  @override
  void mouseUp(MouseEvent e) {}

  @override
  void addUnit(Unit unit) {}

  @override
  void addProjectile(Projectile projectile) {}

  @override
  void addEntity(Entity entity) {}

  @override
  void addObstacle(Obstacle obstacle) {}

  @override
  void removeUnit(Unit unit) {}

  @override
  void removeProjectile(Projectile projectile) {}

  @override
  void removeEntity(Entity entity) {}

  @override
  void removeObstacle(Obstacle obstacle) {}
}
