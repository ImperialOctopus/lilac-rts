import 'package:vector_math/vector_math.dart';

import '../input/mouse.dart';
import '../lilac_game.dart';
import '../stage/game_object.dart';
import '../stage/stages/stage.dart';
import 'shapes/shape.dart';

class Renderer {
  static const String backgroundColour = "#666666";

  LilacGame game;

  Renderer(this.game);

  void start() {}

  void render(Stage stage) {
    renderBase(stage);
    renderStage(stage);
    renderUI(stage);
  }

  void renderBase(Stage stage) {
    game.context
      ..beginPath()
      ..rect(0, 0, game.context.canvas.width, game.context.canvas.height)
      ..fillStyle = backgroundColour
      ..fill();
    game.context
      ..beginPath()
      ..rect(-stage.cameraPosition.x, -stage.cameraPosition.y, stage.width,
          stage.height)
      ..fillStyle = stage.colour
      ..fill();
  }

  void renderStage(Stage stage) {
    for (GameObject gameObject in stage.gameObjects) {
      for (Shape shape in gameObject.renderShapes()) {
        shape.render(game.context);
      }
    }
  }

  void renderUI(Stage stage) {
    renderSelection();
  }

  void renderSelection() {
    if (game.input.mouse.selecting) {
      Vector2 p1 = game.input.mouse.position1;
      Vector2 p2 = game.input.mouse.mousePosition;

      game.context
        ..beginPath()
        ..rect(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y)
        ..strokeStyle = Mouse.lineColour
        ..lineWidth = Mouse.lineThickness
        ..stroke();
    }
  }
}
