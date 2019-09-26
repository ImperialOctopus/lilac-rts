import 'package:vector_math/vector_math.dart';

import '../lilac_game.dart';
import '../stage/game_object.dart';
import '../stage/stage.dart';
import 'shapes/shape.dart';

class Renderer {
  LilacGame game;

  Renderer(this.game);

  void start() {}

  void render(Stage stage) {
    renderBase(stage);
    renderStage(stage);
    renderUI(stage);
  }

  void renderBase(Stage stage) {
    print(game.context.canvas.height);
    print(game.context.canvas.width);
    game.context
      ..beginPath()
      ..rect(0, 0, game.context.canvas.width, game.context.canvas.height)
      ..fillStyle = "#222222"
      ..fill();
    game.context
      ..beginPath()
      ..rect(-stage.cameraPosition.x, -stage.cameraPosition.y, stage.width,
          stage.height)
      ..fillStyle = stage.color
      ..fill();
  }

  void renderStage(Stage stage) {
    Vector2 offset = stage.cameraPosition;
    stage.gameObjects.forEach((GameObject gameObject) {
      gameObject.renderShapes().forEach((Shape shape) {
        shape.render(game.context, gameObject.position - offset);
      });
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
}
