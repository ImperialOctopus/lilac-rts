import 'package:vector_math/vector_math.dart';

import '../input/mouse.dart';
import '../lilac_game.dart';
import '../menu/menu_items/menu_item.dart';
import '../menu/menus/menu.dart';
import '../stage/game_objects/game_object.dart';
import '../stage/stages/stage.dart';
import 'shapes/shape.dart';

class Renderer {
  static const String backgroundColour = "#666666";

  LilacGame game;

  Renderer(this.game);

  void start() {}

  void render(Stage stage, Menu menu) {
    renderBackground();
    if (stage != null) {
      renderStageBackground(stage);
      renderStageObjects(stage);
      renderSelection();
    }
    if (menu != null) {
      renderMenuObjects(menu);
    }
  }

  void renderBackground() {
    game.context
      ..beginPath()
      ..rect(0, 0, game.context.canvas.width, game.context.canvas.height)
      ..fillStyle = backgroundColour
      ..fill();
  }

  void renderStageBackground(Stage stage) {
    game.context
      ..beginPath()
      ..rect(-stage.cameraPosition.x, -stage.cameraPosition.y, stage.width,
          stage.height)
      ..fillStyle = stage.backgroundColour
      ..fill();
  }

  void renderStageObjects(Stage stage) {
    for (GameObject gameObject in stage.gameObjects) {
      for (Shape shape in gameObject.renderShapes) {
        shape.render();
      }
    }
  }

  void renderSelection() {
    if (game.stage.selectionStart != null) {
      Vector2 p1 = game.stage.selectionStart;
      Vector2 p2 = game.input.mouse.mousePosition;

      game.context
        ..beginPath()
        ..rect(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y)
        ..strokeStyle = Mouse.lineColour
        ..lineWidth = Mouse.lineThickness
        ..stroke();
    }
  }

  void renderMenuObjects(Menu menu) {
    for (MenuItem menuItem in menu.menuItems) {
      menuItem.render();
    }
  }
}
