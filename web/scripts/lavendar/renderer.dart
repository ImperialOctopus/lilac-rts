import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../game.dart';
import '../input/unit_select.dart';
import '../lilac/entities/entity.dart';

class Renderer {
  final backgroundColour = "#FFFFFF";

  CanvasRenderingContext2D context;
  List<Entity> entityList;

  UnitSelect unitSelect;

  Renderer(this.context, this.entityList, this.unitSelect);

  void start() {
    awaitFrame();
  }

  Future awaitFrame() async {
    render(await window.animationFrame);
  }

  void render(num m) {
    clear();

    for (Entity e in entityList) {
      renderEntity(e);
    }
    renderSelection();

    awaitFrame();
  }

  void renderEntity(Entity entity) {
    int radius;
    String colour;

    if (entity.entityType == EntityType.Unit) {
      radius = 10;
      if (entity.team == Team.Friendly) {
        if (unitSelect.selectedUnits.contains(entity)) {
          colour = "#64b5f6";
        } else {
          colour = "#2196f3";
        }
      } else {
        colour = "#c2185b";
      }
    } else if (entity.entityType == EntityType.Projectile) {
      radius = 3;
      if (entity.team == Team.Friendly) {
        colour = "#000000";
      } else {
        colour = "#880e4f";
      }
    }
    context
      ..beginPath()
      ..arc(entity.position.x, entity.position.y, radius, 0, 2 * pi)
      ..fillStyle = colour
      ..fill();
  }

  void renderSelection() {
    if (unitSelect.selecting) {
      Vector2 p1 = unitSelect.position1;
      Vector2 p2 = unitSelect.mousePosition;

      context
        ..beginPath()
        ..rect(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y)
        ..strokeStyle = "#000000"
        ..lineWidth = 2
        ..stroke();
    }
  }

  void clear() {
    context
      ..beginPath()
      ..rect(0, 0, Game.stageWidth, Game.stageHeight)
      ..fillStyle = backgroundColour
      ..fill();
  }
}
