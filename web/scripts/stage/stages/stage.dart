import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../engine/time.dart';
import '../../lilac_game.dart';
import '../../menu/menus/menu_main.dart';
import '../entity.dart';
import '../game_object.dart';
import '../obstacles/obstacle.dart';
import '../obstacles/obstacle_wall.dart';
import '../projectile.dart';
import '../units/unit.dart';

class Stage {
  LilacGame game;
  Time time;

  int height;
  int width;
  String colour;

  Set<Unit> units;
  Set<Projectile> projectiles;
  Set<Entity> entities;
  Set<Obstacle> obstacles;

  List<Unit> selectedUnits;
  Vector2 selectionStart;
  Vector2 selectionEnd;
  bool selecting;

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
    time = Time();
    selectedUnits = List<Unit>();
    selecting = false;
  }

  List<GameObject> get gameObjects {
    return [...units, ...projectiles, ...entities, ...obstacles];
  }

  void start() {
    // Centre camera
    cameraPosition = Vector2(
        -(game.canvas.width - width) / 2, -(game.canvas.height - height) / 2);
    // Add bounding walls
    addObstacle(ObstacleWall(Vector2(0, 0), Vector2(0, width.toDouble())));
    addObstacle(ObstacleWall(Vector2(0, 0), Vector2(height.toDouble(), 0)));
    addObstacle(ObstacleWall(Vector2(height.toDouble(), width.toDouble()),
        Vector2(0, width.toDouble())));
    addObstacle(ObstacleWall(Vector2(height.toDouble(), width.toDouble()),
        Vector2(height.toDouble(), 0)));
  }

  void quit() {
    game.unloadStage();
    game.loadMenu(MenuMain(game));
  }

  void mouseDown(MouseEvent e) {
    // Left click
    if (e.button == 0) {
      startDrag(Vector2(e.offset.x, e.offset.y));
      if (e.ctrlKey) {
        print(Vector2(e.offset.x, e.offset.y) + cameraPosition);
      }
    }
    // Right click
    else if (e.button == 2) {
      if (e.ctrlKey) {
        setFireTarget(Vector2(e.offset.x, e.offset.y));
      } else {
        setMoveTarget(Vector2(e.offset.x, e.offset.y));
      }
    } // Middle click
    else if (e.button == 1) {
      setFireTarget(Vector2(e.offset.x, e.offset.y));
    }
  }

  void mouseUp(MouseEvent e) {
    if (e.button == 0) {
      stopDrag(Vector2(e.offset.x, e.offset.y));
    }
  }

  void startDrag(Vector2 position) {
    selectionStart = position;
  }

  void stopDrag(Vector2 position) {
    if (selectionStart != null) {
      selectionEnd = position;
      select();
    }
  }

  void setMoveTarget(Vector2 position) {
    for (Unit u in selectedUnits) {
      u.moveTarget = position + cameraPosition;
    }
  }

  void setFireTarget(Vector2 position) {
    for (Unit u in selectedUnits) {
      u.fireTarget = position + cameraPosition;
    }
  }

  void select() {
    Rectangle selection = Rectangle.fromPoints(
        Point(selectionStart.x + cameraPosition.x,
            selectionStart.y + cameraPosition.y),
        Point(selectionEnd.x + cameraPosition.x,
            selectionEnd.y + cameraPosition.y));

    selectedUnits.clear();
    for (var unit in units) {
      if (unit.team == Team.Friendly) {
        if (selection.containsPoint(Point(unit.position.x, unit.position.y))) {
          selectedUnits.add(unit);
        }
      }
    }

    selectionStart = null;
    selectionEnd = null;
  }

  void selectUnit(Unit u) {
    selectedUnits.clear();
    selectedUnits.add(u);
  }

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

  Vector2 randomPosition() {
    Random random = Random();
    return Vector2(
        random.nextInt(width).toDouble(), random.nextInt(height).toDouble());
  }
}
