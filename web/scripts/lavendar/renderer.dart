import 'dart:html';
import 'dart:math';
import 'package:vector_math/vector_math.dart';
import '../game.dart';
import '../input/unit_select.dart';
import '../lilac/entities/entity.dart';

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
    drawCircleWorld(entity.position, radius, colour);
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

  void drawCircleWorld(Vector2 position, int radius, String colour) {
    double scale = Game.renderScale();
    Vector2 offset = Game.canvasOffset();
    context
      ..beginPath()
      ..arc((position.x * scale) + offset.x, (position.y * scale) + offset.y,
          radius * scale, 0, 2 * pi)
      ..fillStyle = colour
      ..fill();
  }

  void drawFilledRectWorld() {}

  void clear() {
    context
      ..beginPath()
      ..rect(0, 0, canvas.width, canvas.height)
      ..fillStyle = backgroundColour
      ..fill();
  }
}
