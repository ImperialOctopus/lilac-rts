import 'package:vector_math/vector_math.dart';

import '../lilac-game.dart';
import '../stage/game-object.dart';
import '../stage/stage.dart';

class Renderer {
  Renderer(this.game);

  LilacGame game;

  void start() {}

  Future<void> render(Stage stage) async {
    await renderBase(stage);
    await renderStage(stage);
    await renderUI(stage);
  }

  void renderBase(Stage stage) {
    game.context
      ..beginPath()
      ..rect(0, 0, stage.width, stage.height)
      ..fillStyle = stage.color
      ..fill();
  }

  void renderStage(Stage stage) {
    stage.gameObjects.forEach((GameObject gameObject) {
      gameObject.render();
    });
  }

  void renderUI(Stage stage) {
    renderSelection();
  }

  void renderSelection() {
    if (game.input.unitSelect.selecting) {
      Vector2 p1 = game.input.unitSelect.position1;
      Vector2 p2 = game.input.unitSelect.mousePosition;

      game.context
        ..beginPath()
        ..rect(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y)
        ..strokeStyle = "#000000"
        ..lineWidth = 2
        ..stroke();
    }
  }

  void renderObject(GameObject gameObject) {
    /*
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
      */
  }
}
