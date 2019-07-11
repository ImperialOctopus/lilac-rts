import 'dart:html';
import 'dart:math';
import 'package:vector_math/vector_math.dart';
import '../game.dart';
import '../input/unit_select.dart';
import '../lilac/entities/entity.dart';
import '../lilac/entities/unit.dart';

class Renderer {
  final backgroundColour = "#FFFFFF";
  final stageColour = "#DDDDDD";

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  List<Entity> entityList;

  UnitSelect unitSelect;

  Renderer(this.canvas, this.entityList, this.unitSelect) {
    context = canvas.context2D;
  }

  void start() {
    awaitFrame();
  }

  Future awaitFrame() async {
    render(await window.animationFrame);
  }

  void render(num m) {
    clear();

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    renderStage();

    for (Entity e in entityList) {
      renderEntity(e);
      renderReloadBar(e);
    }
    renderSelection();

    awaitFrame();
  }

  void renderStage() {
    Vector2 offset = Game.canvasOffset();
    int dimension = Game.canvasSize();
    context
      ..beginPath()
      ..rect(offset.x, offset.y, dimension, dimension)
      ..fillStyle = stageColour
      ..fill();
  }

  void renderEntity(Entity entity) {
    double radius;
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
    drawCircle(entity.position, radius, colour);
  }

  void renderReloadBar(Entity entity) {
    if (entity.entityType == EntityType.Unit &&
        entity.team == Team.Friendly &&
        !(entity as Unit).canFire()) {
      drawCircleSegment(entity.position, 7,
          1 - (entity as Unit).fireCooldownFraction, "#0d47a1");
    }
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

  void drawCircle(Vector2 position, double radius, String colour) {
    position = Game.stageToWorld(position);
    radius *= Game.renderScale();
    context
      ..beginPath()
      ..arc(position.x, position.y, radius, 0, 2 * pi)
      ..fillStyle = colour
      ..fill();
  }

  void drawCircleSegment(
      Vector2 position, double radius, double fraction, String colour) {
    position = Game.stageToWorld(position);
    radius *= Game.renderScale();
    context
      ..beginPath()
      ..arc(position.x, position.y, radius, 3 / 2 * pi,
          3 / 2 * pi + (2 * pi * fraction))
      ..lineTo(position.x, position.y)
      ..lineTo(position.x, position.y - radius)
      ..fillStyle = colour
      ..fill();
  }

  void clear() {
    context
      ..beginPath()
      ..rect(0, 0, canvas.width, canvas.height)
      ..fillStyle = backgroundColour
      ..fill();
  }
}
